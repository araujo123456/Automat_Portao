# 🚪 ESP32 Smart Gate Controller

### Controle inteligente de portão eletrônico com Wi-Fi, dashboard e senha por botão

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
![Platform](https://img.shields.io/badge/platform-ESP32-blue)
![Framework](https://img.shields.io/badge/framework-Arduino-green)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

---

## 📌 Sobre o projeto

Este projeto consiste em um **controlador inteligente de portão eletrônico** baseado em ESP32, capaz de:

* 📡 Conectar-se ao Wi-Fi
* 🌐 Fornecer um **dashboard web moderno**
* 🔐 Controlar acesso via login e senha
* 🔘 Permitir abertura do portão por **sequência secreta no botão físico**
* 📺 Exibir informações em um **display OLED**
* 🔄 Possuir sistema de recuperação automática e reset de fábrica

> 💡 Ideal para automação residencial, retrofit de porteiros eletrônicos e projetos IoT avançados.

---

## 🧠 Arquitetura do sistema

```
[Porteiro] → [Optoacoplador] → ESP32 → [Transistor] → [Controle PPA]
                                  ↓
                              [Display OLED]
                                  ↓
                              [Wi-Fi / Web]
```

---

## ⚙️ Funcionalidades

### 🌐 Dashboard Web

* Acesso via navegador
* Login com autenticação
* Botão para abrir o portão
* Alteração de senha do sistema
* Configuração da senha do botão físico

---

### 🔘 Controle por botão físico (senha secreta)

O portão pode ser aberto através de uma sequência de pressionamentos:

Exemplo:

```
2 cliques → pausa → 1 clique → pausa → 3 cliques
```

✔️ Totalmente configurável pelo painel web
✔️ Suporte a 3 ou 4 dígitos

---

### 📡 Modo Setup (Auto configuração)

Caso não haja Wi-Fi configurado, o ESP32 cria uma rede:

```
SSID: ESP32_Config_Portao
Senha: config1234
IP: 192.168.4.1
```

Permite configurar:

* Rede Wi-Fi
* Usuário e senha do sistema

---

### 🔐 Segurança

* Login obrigatório no dashboard
* Senha mínima de 6 caracteres
* Reset físico com confirmação
* Isolamento elétrico via optoacoplador

---

### 🧯 Sistema de recuperação

* 🔄 Reinício automático se perder Wi-Fi por 5 minutos
* 🧠 Watchdog Timer ativo
* 🧹 Reset de fábrica via botão BOOT

---

## 🔌 Hardware utilizado

* ESP32 Dev Module
* Display OLED 128x64 (SH1106)
* Optoacoplador PC817
* Transistor BC337
* Resistores:

  * 1kΩ (base do transistor)
  * 10kΩ (pull-up / ajustes)
* Capacitor eletrolítico 1000µF
* Controle remoto PPA
* Porteiro eletrônico (Intelbras ou similar)

---

## 🔧 Pinagem

| Função             | GPIO |
| ------------------ | ---- |
| Botão porteiro     | 25   |
| Acionamento portão | 33   |
| Display SDA        | 21   |
| Display SCL        | 22   |
| Botão BOOT         | 0    |

---

## 🧪 Tecnologias utilizadas

* ESP32
* Arduino Framework
* ESPAsyncWebServer
* AsyncTCP
* U8g2 (display OLED)
* Preferences (armazenamento persistente)

---

## 📦 Estrutura do projeto

```
📁 src/
 └── main.cpp

📁 include/
📁 lib/

📄 platformio.ini
📄 README.md
```

---

## ⚙️ Instalação (PlatformIO)

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
```

2. Abra no VS Code com PlatformIO

3. Compile e envie para o ESP32:

```bash
pio run --target upload
```

4. Monitor serial:

```bash
pio device monitor
```

---

## 🧠 Lógica do sistema

### Fluxo principal:

1. Verifica se há Wi-Fi salvo
2. Se não houver → entra em modo AP
3. Se houver → conecta ao Wi-Fi
4. Inicia servidor web
5. Aguarda comandos

---

## 🔥 Melhorias futuras

* [ ] OTA (atualização via Wi-Fi)
* [ ] HTTPS
* [ ] Integração com Home Assistant
* [ ] Notificações no celular
* [ ] App mobile
* [ ] Logs no dashboard
* [ ] Controle por MQTT

---

## ⚠️ Observações importantes

* O optoacoplador garante isolamento elétrico
* Não conectar 5V diretamente no pino 3.3V do ESP32
* Recomenda-se fonte estável para evitar resets

---

## 🧑‍💻 Autor

**Julio Cesar**

Projetos de eletrônica, IoT e automação residencial.

---

## 📜 Licença

Este projeto está sob a licença MIT.
Sinta-se livre para usar, modificar e evoluir.

---

## ⭐ Contribuição

Pull requests são bem-vindos!
Se você tiver ideias ou melhorias, fique à vontade para contribuir.

---

## 💡 Inspiração

Projeto desenvolvido com foco em:

* Automação residencial acessível
* Segurança
* Integração entre sistemas analógicos e digitais
* Criação de produtos IoT reais

---

🚀 *Se esse projeto te ajudou, não esqueça de dar uma estrela no repositório!*
