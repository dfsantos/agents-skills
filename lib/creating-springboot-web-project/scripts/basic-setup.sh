#!/bin/bash

set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Uso: $0 <groupId> <artifactId>"
    exit 1
fi

GROUP_ID="$1"
ARTIFACT_ID="$2"
JAVA_VERSION="25"
DEPENDENCIES="web"
DESCRIPTION="Spring Boot project"

ARTIFACT_NORMALIZED="${ARTIFACT_ID//-/.}"
PACKAGE_NAME="$GROUP_ID.$ARTIFACT_NORMALIZED"

spring init \
    -g="$GROUP_ID" \
    -a="$ARTIFACT_ID" \
    --package-name="$PACKAGE_NAME" \
    -j="$JAVA_VERSION" \
    --description="$DESCRIPTION" \
    -d="$DEPENDENCIES" \
    "$ARTIFACT_ID"

echo "✅ Projeto criado com sucesso em: $ARTIFACT_ID"