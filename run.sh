#!/usr/bin/env bash
set -e

source /usr/lib/bashio/bashio.sh

bashio::log.info "Starting Audiobookshelf..."

METADATA_PATH=$(bashio::config 'metadata_path')
mkdir -p "${METADATA_PATH}"

export PORT=13378
export CONFIG_PATH=/config
export METADATA_PATH="${METADATA_PATH}"

bashio::log.info "Metadata: ${METADATA_PATH}"
bashio::log.info "Media available at /media"

exec tini -- node /app/index.js
