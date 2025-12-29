
# Sobre o Projeto

No fluxo de trabalho digital de hoje, lidamos com uma variedade crescente de formatos de imagem: JPEGs de câmeras, PNGs com transparência, e formatos modernos para a web como WebP e AVIF. A conversão entre esses tipos muitas vezes requer ferramentas diferentes ou processos online demorados.

Este projeto nasceu para simplificar e unificar essa tarefa. Integrado diretamente ao Nautilus, ele utiliza o poder do `ffmpeg` para oferecer uma solução de conversão universal, rápida e eficiente, diretamente no seu menu de contexto.

# Recursos

- 🔄 **Conversão Universal:** Converta de e para os formatos mais populares, incluindo `PNG`, `JPG`, `WebP`, `AVIF`, `GIF`, `BMP` e `TIFF`.
- 🗂️ **Suporte a Múltiplos Arquivos:** Selecione quantos arquivos de imagem desejar e converta todos de uma só vez.
- 🖥️ **Interface Gráfica Simples:** Uma caixa de diálogo nativa permite que você escolha facilmente o formato de saída desejado.
- 🚀 **Motor `imagemagick`:** Utiliza o `ffmpeg`, uma das ferramentas de conversão de mídia mais poderosas e rápidas disponíveis.

Para o GNOME 46+ (e versões recentes do Nautilus), a maneira mais nativa, leve e "sem instalação de softwares pesados" de adicionar funcionalidades ao menu de contexto é através dos Nautilus Scripts.

Abaixo, apresento uma solução robusta que utiliza:

ImageMagick: O padrão da indústria para manipulação de imagem via CLI.

Zenity: Para criar as janelas de diálogo nativas do GNOME (seleção e barra de progresso).

Shell Scripting: Para a lógica de automação.

# 1. **Pré-requisitos**

Para que o script funcione com todos os formatos modernos (AVIF, HEIC, JXL, WebP), você precisa garantir que o "motor" de conversão esteja instalado.

Abra o terminal e execute:
# No Fedora/RHEL/CentOS

```
sudo dnf install imagemagick zenity libheif libjxl
```

# No Ubuntu/Debian/Pop!_OS/Zorin

```
sudo apt update
sudo apt install imagemagick zenity heif-gdk-pixbuf
```

## **Instalação**

Baixe o arquivo superconverter.sh
mova para /home/seu_user/.local/share/nautilus/scripts (substitua "seu_user pelo seu usuário")
Torne o arquivo superconverter.sh executável com o comando:

```
chmod +x ~/.local/share/nautilus/scripts/"superconverter.sh"
```

**Como Usar**

Agora a funcionalidade está integrada ao seu sistema:

Abra o Arquivos (Nautilus).

Selecione uma ou várias imagens (segurando Ctrl ou Shift).

Clique com o botão direito na seleção.

Vá até o menu Scripts.

Clique em Converter Imagem.

Uma janela aparecerá. Escolha o formato (ex: WebP) e clique em OK.

Uma barra de progresso aparecerá e os novos arquivos serão criados na mesma pasta.

**Demonstração**

**Veja o vídeo de exemplo:**
    superconverter-tool.mp4)
*************************

## Desinstalação

1. Navegue novamente até a pasta de instalação: /home/seu_user/.local/share/nautilus/scripts
2. Remova\Delete o arquivo superconverter.sh
3. Reinicie o Dolphin para que o menu de serviço desapareça.
```
nautilus -q
```

## Autor

- **Ney Designer**

## [![ko-fi](https://camo.githubusercontent.com/201ef269611db7eb6b5d08e9f756ab8980df3014b64492770bdf13a6ed924641/68747470733a2f2f6b6f2d66692e636f6d2f696d672f676974687562627574746f6e5f736d2e737667)](https://ko-fi.com/K3K01KWCZW)
