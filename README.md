# Audiobookshelf

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]

Self-hosted audiobook and podcast server for Home Assistant.

## About

[Audiobookshelf](https://www.audiobookshelf.org/) is a self-hosted audiobook and podcast server. This add-on wraps the official Docker image for seamless Home Assistant integration.

## Features

- Stream audiobooks and podcasts from your media library
- Multi-user support with individual progress tracking
- Mobile apps for iOS and Android
- Podcast subscription and automatic downloads
- Home Assistant Ingress support
- WebSocket streaming for real-time updates

## Installation

1. Add this repository to Home Assistant
2. Install the "Audiobookshelf" add-on
3. Start the add-on
4. Open the Web UI via the sidebar

## NAS/Network Storage Setup

To access audiobooks from a NAS:

1. Go to **Settings → System → Storage**
2. Click **Add Network Storage**
3. Configure your SMB/NFS share
4. The share appears under `/media/<share-name>`
5. In Audiobookshelf, add a library with path `/media/<share-name>/audiobooks`

## Configuration

| Option | Description | Default |
|--------|-------------|---------|
| `metadata_path` | Path for database and metadata | `/share/audiobookshelf/metadata` |

## Mobile Apps

- **iOS**: [App Store](https://apps.apple.com/app/audiobookshelf/id1644345104)
- **Android**: [Play Store](https://play.google.com/store/apps/details?id=com.audiobookshelf.app)

For mobile app access, enable port 13378 in the add-on network configuration.

## Support

- [Audiobookshelf Documentation](https://www.audiobookshelf.org/docs)
- [GitHub Issues](https://github.com/helix-git/haos-abs/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
