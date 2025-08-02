#!/bin/bash

SCRIPT_NAME="size"
TARGET_PATH="/usr/local/bin/$SCRIPT_NAME"


# Verifica se o script está instalado
if [ ! -f "$TARGET_PATH" ]; then
    echo "O comando '$SCRIPT_NAME' não está instalado em $TARGET_PATH."
    exit 1
fi


# Solicita confirmação
read -p "Tem certeza que deseja desinstalar '$SCRIPT_NAME'? [s/N]: " confirm
if [[ "$confirm" != "s" && "$confirm" != "S" ]]; then
    echo "Desinstalação cancelada."
    exit 0
fi

# Tenta remover o ficheiro
echo "Removendo $TARGET_PATH..."
sudo rm "$TARGET_PATH"


# Verifica se foi removido com sucesso
if [ ! -f "$TARGET_PATH" ]; then
    echo "Desinstalação concluída com sucesso."
else
    echo "Erro: falha ao remover '$TARGET_PATH'."
    exit 1
fi