#!/bin/bash

# Caminho do diretório onde os arquivos de log estão armazenados
LOG_DIR="/vol10/axway/apigateway/trace"

# Verificar se o diretório existe
if [ ! -d "$LOG_DIR" ]; then
    echo "Diretório $LOG_DIR não encontrado."
    exit 1
fi

# Encontrar o arquivo mais recente no diretório
MOST_RECENT_FILE=$(ls -t "$LOG_DIR" 2>/dev/null | head -n 1)

# Verificar se algum arquivo foi encontrado
if [ -z "$MOST_RECENT_FILE" ]; then
    echo "Nenhum arquivo encontrado no diretório $LOG_DIR."
    exit 1
fi

# Caminho completo do arquivo mais recente
MOST_RECENT_FILE_PATH="$LOG_DIR/$MOST_RECENT_FILE"

echo "Arquivo mais recente: $MOST_RECENT_FILE_PATH"
echo "Iniciando tail -f no arquivo..."

# Executar tail -f no arquivo mais recente
tail -f "$MOST_RECENT_FILE_PATH"

