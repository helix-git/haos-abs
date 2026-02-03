#!/usr/bin/env bash
set -e

OPTIONS_FILE=/data/options.json

echo "[INFO] Starting Audiobookshelf..."

METADATA_PATH=$(jq -r '.metadata_path // "/share/audiobookshelf/metadata"' "$OPTIONS_FILE")
mkdir -p "${METADATA_PATH}"

# Clean up failed migrations
if [ -f "/data/absdatabase.failed.sqlite" ]; then
    echo "[INFO] Removing failed database..."
    rm -f /data/absdatabase.failed.sqlite
fi

export PORT=13378
export CONFIG_PATH=/data
export METADATA_PATH="${METADATA_PATH}"
export NODE_ENV=production
export SOURCE=docker
export ROUTER_BASE_PATH=""

echo "[INFO] Config/DB: /data"
echo "[INFO] Metadata: ${METADATA_PATH}"
echo "[INFO] Media: /media"

cd /app
exec tini -s -- node index.js
