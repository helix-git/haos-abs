#!/usr/bin/env bash
set -e

source /usr/lib/bashio/bashio.sh

bashio::log.info "Starting Audiobookshelf..."

METADATA_PATH=$(bashio::config 'metadata_path')
mkdir -p "${METADATA_PATH}"

export PORT=13378
export CONFIG_PATH=/config
export METADATA_PATH="${METADATA_PATH}"
export NODE_ENV=production

bashio::log.info "Metadata: ${METADATA_PATH}"
bashio::log.info "Media available at /media"

cd /app
exec tini -- node index.js
