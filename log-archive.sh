#!/bin/bash

LOG_DIR="$1"

if [ ! -d "$LOG_DIR" ]; then
    echo "Erro: O diretório '$LOG_DIR' não existe."
    exit 1
fi

echo "Diretório informado: $LOG_DIR"

ARCHIVE_DIR="archives"
mkdir -p "$ARCHIVE_DIR"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

tar -czf "$ARCHIVE_PATH" "$LOG_DIR"

if [ $? -ne 0 ]; then
	echo "Erro ao criar o arquivo de log."
	exit 1
fi

LOG_FILE="${ARCHIVE_DIR}/archive.log"

echo "$TIMESTAMP - Arquivo criado: $ARCHIVE_NAME" >> "$LOG_FILE"
echo "Logs arquivados com sucesso em: $ARCHIVE_PATH" 
