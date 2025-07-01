#!/bin/bash

SCRIPT_NAME="size"
TARGET_DIR="/usr/local/bin"
TARGET_PATH="$TARGET_DIR/$SCRIPT_NAME"

# Verifica se python3 está instalado
if ! command -v python3 &> /dev/null; then
    echo "Erro: Python 3 não está instalado. Por favor, instale-o antes."
    exit 1
fi

# Verifica se o script 'size' existe no diretório atual
if [ ! -f "$SCRIPT_NAME" ]; then
    echo "Erro: Arquivo '$SCRIPT_NAME' não encontrado no diretório atual."
    exit 1
fi

# Copia o script para /usr/local/bin
echo "Copiando $SCRIPT_NAME para $TARGET_DIR..."
sudo cp "$SCRIPT_NAME" "$TARGET_PATH"

# Dá permissão executável
sudo chmod +x "$TARGET_PATH"

# Verifica se a cópia foi bem sucedida
if [ -f "$TARGET_PATH" ]; then
    echo "Instalação concluída com sucesso!"
    echo "Você pode usar o comando '$SCRIPT_NAME' em qualquer lugar do terminal."
else
    echo "Erro: falha na instalação."
    exit 1
fi
