# Web Flasher local para ESP32

Esta versão **não precisa de GitHub Pages**.

## Como usar no Windows

1. Extraia a pasta inteira.
2. Dê duplo clique em `run-local.bat`.
3. O navegador abrirá em `http://localhost:8000/flash.html`.
4. Clique em **Conectar e Gravar**.

## Importante

- Não abra `flash.html` diretamente por duplo clique.
- O erro `Failed to download manifest` acontece quando o arquivo é aberto por `file://`.
- Esta versão resolve isso iniciando um pequeno servidor local no seu próprio computador.

## Arquivos usados

- `bootloader.bin` em `0x1000`
- `partitions.bin` em `0x8000`
- `firmware.bin` em `0x10000`

## Requisitos

- Google Chrome ou Microsoft Edge
- Cabo USB de dados
- Porta COM disponível
