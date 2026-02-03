#!/usr/bin/env bash
set -e

source /usr/lib/bashio/bashio.sh

bashio::log.info "Starting Audiobookshelf Add-on..."

# Read configuration
METADATA_PATH=$(bashio::config 'metadata_path')
mkdir -p "${METADATA_PATH}"

bashio::log.info "Metadata path: ${METADATA_PATH}"

# List configured library paths
bashio::log.info "Configured library paths:"
for path in $(bashio::config 'library_paths'); do
    if [ -d "${path}" ]; then
        bashio::log.info "  - ${path} (available)"
    else
        bashio::log.warning "  - ${path} (not found)"
    fi
done

# Set environment for Audiobookshelf
export PORT=13378
export CONFIG_PATH=/config
export METADATA_PATH="${METADATA_PATH}"

bashio::log.info "Audiobookshelf is ready"
bashio::log.info "Add libraries in Audiobookshelf UI using the configured library paths"

# Start Audiobookshelf
exec tini -- node /app/index.js
