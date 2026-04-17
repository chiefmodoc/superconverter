#!/bin/bash

# ==============================================================================
# Título: Nautilus Super Image Converter (Versão 3.0 - Com JXL)
# Autor: chiefmodoc
# Atualização: Adicionado suporte a JXL, HEIC e HEIF no menu.
# ==============================================================================

# 1. Detecção Inteligente do Motor de Conversão
if command -v magick &> /dev/null; then
    CONVERT_CMD="magick"
elif command -v convert &> /dev/null; then
    CONVERT_CMD="convert"
else
    zenity --error --text="Erro Crítico: ImageMagick não encontrado.\nInstale com: sudo apt install imagemagick"
    exit 1
fi

# 2. Captura os arquivos
IFS=$'\n'
files=($NAUTILUS_SCRIPT_SELECTED_FILE_PATHS)
unset IFS

if [ ${#files[@]} -eq 0 ]; then
    files=("$@")
fi

if [ ${#files[@]} -eq 0 ]; then
    zenity --error --text="Nenhuma imagem selecionada."
    exit 1
fi

# 3. Diálogo de Escolha (Adicionado JXL, HEIC, HEIF)
TARGET_FORMAT=$(zenity --list --title="Converter Imagens" \
    --text="Motor detectado: $CONVERT_CMD\nPara qual formato converter?" \
    --radiolist \
    --height=480 \
    --width=380 \
    --column="Check" --column="Extensão" --column="Detalhes" \
    TRUE "jpg" "JPEG (Fotos Padrão)" \
    FALSE "png" "PNG (Transparência)" \
    FALSE "webp" "WebP (Google/Web - Leve)" \
    FALSE "jxl" "JPEG XL (Novo Padrão Alta Eficiência)" \
    FALSE "avif" "AVIF (Compressão Extrema)" \
    FALSE "heic" "HEIC (Padrão iPhone/Apple)" \
    FALSE "heif" "HEIF (Padrão Samsung/Android)" \
    FALSE "pdf" "PDF (Documento)" \
    FALSE "tiff" "TIFF (Impressão Profissional)" \
    FALSE "ico" "ICO (Ícones Windows)" \
    FALSE "bmp" "BMP (Raw Bitmap)")

if [ -z "$TARGET_FORMAT" ]; then
    exit 0
fi

# 4. Processamento
(
count=0
total=${#files[@]}

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        dirname=$(dirname "$file")
        filename=$(basename "$file")
        filename_no_ext="${filename%.*}"
        
        output_file="$dirname/$filename_no_ext.$TARGET_FORMAT"
        
        echo "# Convertendo: $filename -> $TARGET_FORMAT"
        
        # Executa a conversão
        "$CONVERT_CMD" "$file" "$output_file"
        
        if [ $? -ne 0 ]; then
            echo "# Erro ao converter: $filename"
        fi
    fi
    
    count=$((count + 1))
    percent=$((count * 100 / total))
    echo "$percent"
done
) | zenity --progress \
    --title="Processando Imagens" \
    --text="Iniciando..." \
    --percentage=0 \
    --auto-close

# 5. Notificação
notify-send "Conversão Concluída" "Arquivos processados para o formato $TARGET_FORMAT" -i accessories-image-viewer
