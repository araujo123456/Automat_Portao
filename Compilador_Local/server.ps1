$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Web

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$listener = New-Object System.Net.HttpListener
$prefix = 'http://localhost:8000/'
$listener.Prefixes.Add($prefix)
$listener.Start()

Write-Host ''
Write-Host 'Servidor iniciado em http://localhost:8000/flash.html' -ForegroundColor Green
Write-Host 'Pressione Ctrl+C nesta janela para encerrar.' -ForegroundColor Yellow
Start-Process 'http://localhost:8000/flash.html'

function Get-ContentType([string]$path) {
    switch ([System.IO.Path]::GetExtension($path).ToLower()) {
        '.html' { 'text/html; charset=utf-8' }
        '.json' { 'application/json; charset=utf-8' }
        '.js'   { 'application/javascript; charset=utf-8' }
        '.css'  { 'text/css; charset=utf-8' }
        '.bin'  { 'application/octet-stream' }
        '.ico'  { 'image/x-icon' }
        default { 'application/octet-stream' }
    }
}

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $requestPath = $context.Request.Url.AbsolutePath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($requestPath)) { $requestPath = 'flash.html' }
        $localPath = Join-Path $root $requestPath

        if ((Test-Path $localPath) -and -not (Get-Item $localPath).PSIsContainer) {
            $bytes = [System.IO.File]::ReadAllBytes($localPath)
            $context.Response.ContentType = Get-ContentType $localPath
            $context.Response.ContentLength64 = $bytes.Length
            $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $msg = [System.Text.Encoding]::UTF8.GetBytes('404 - Arquivo não encontrado')
            $context.Response.StatusCode = 404
            $context.Response.ContentType = 'text/plain; charset=utf-8'
            $context.Response.ContentLength64 = $msg.Length
            $context.Response.OutputStream.Write($msg, 0, $msg.Length)
        }
        $context.Response.OutputStream.Close()
    }
}
finally {
    $listener.Stop()
    $listener.Close()
}
