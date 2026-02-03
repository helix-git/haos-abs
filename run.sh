#!/usr/bin/env bash
set -e

# Options are in /data/options.json
CONFIG_PATH=/data/options.json

echo "[INFO] Starting Audiobookshelf..."

# Read config using jq
METADATA_PATH=$(jq -r '.metadata_path // "/share/audiobookshelf/metadata"' "$CONFIG_PATH")
mkdir -p "${METADATA_PATH}"

export PORT=13378
export CONFIG_PATH=/config
export METADATA_PATH="${METADATA_PATH}"
export NODE_ENV=production

echo "[INFO] Metadata: ${METADATA_PATH}"
echo "[INFO] Media available at /media"

cd /app
exec tini -- node index.js
