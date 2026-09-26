#!/bin/bash

set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Uso: $0 <appName>"
    exit 1
fi

APP_NAME="$1"

npx create-next-app@latest "$APP_NAME" --yes

echo "✅ Projeto criado com sucesso em: $APP_NAME"