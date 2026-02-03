# Audiobookshelf Add-on

Self-hosted audiobook and podcast server for Home Assistant.

## Installation

Add this repository to Home Assistant and install the Audiobookshelf add-on.

## Configuration

- **metadata_path**: Where ABS stores metadata (default: `/share/audiobookshelf/metadata`)

## Usage

1. Start the add-on
2. Open Web UI via Ingress
3. Add libraries pointing to `/media/<your-share>`

Your NAS shares mounted via HA Network Storage are available at `/media`.
