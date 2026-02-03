# Audiobookshelf Add-on Documentation

## Overview

This add-on provides [Audiobookshelf](https://www.audiobookshelf.org/), a self-hosted audiobook and podcast server, integrated with Home Assistant.

## Configuration

### metadata_path

The path where Audiobookshelf stores its database, cache, and metadata files.

**Default:** `/share/audiobookshelf/metadata`

This path should be persistent and included in your backups.

## Setting Up Network Storage

### Step 1: Add Network Storage in Home Assistant

1. Navigate to **Settings → System → Storage**
2. Click **Add Network Storage**
3. Fill in your NAS details:
   - **Name**: A friendly name (e.g., "audiobooks")
   - **Server**: Your NAS IP or hostname
   - **Type**: SMB or NFS
   - **Share**: The share name on your NAS
   - **Username/Password**: If required

### Step 2: Configure Audiobookshelf Library

1. Open Audiobookshelf via the sidebar
2. Go to **Settings → Libraries**
3. Click **Add Library**
4. Enter the path: `/media/<your-share-name>`
5. Select the library type (Audiobooks or Podcasts)

### Example Paths

| NAS Share Name | Path in Audiobookshelf |
|----------------|------------------------|
| audiobooks | `/media/audiobooks` |
| media | `/media/media/audiobooks` |
| nas-share | `/media/nas-share/Audio/Books` |

## Mobile App Setup

### Using Home Assistant External URL

1. Ensure external access is configured in Home Assistant
2. In the mobile app, use your HA external URL
3. The app connects through Home Assistant's authentication

### Using Direct Port Access

1. In the add-on configuration, set port 13378 to a host port
2. In the mobile app, connect directly to `http://your-ha-ip:13378`
3. Create a separate Audiobookshelf account (not linked to HA)

## Audiobook Organization

Audiobookshelf works best with organized audiobook folders:

```
/media/audiobooks/
├── Author Name/
│   └── Book Title/
│       ├── cover.jpg (optional)
│       ├── chapter01.mp3
│       ├── chapter02.mp3
│       └── metadata.json (optional)
```

Or flat structure:

```
/media/audiobooks/
├── Book Title 1/
│   └── audiobook.m4b
└── Book Title 2/
    └── audiobook.mp3
```

## Backup

The metadata path contains critical data:

- SQLite database with library information
- User accounts and progress
- Cover images and cached metadata

**Include `/share/audiobookshelf` in your backups!**

## Troubleshooting

### Library not scanning

- Check the add-on logs for "Available media directories"
- Verify the network storage is mounted in HA
- Ensure folder permissions allow reading

### WebSocket connection issues

- Ensure `ingress_stream: true` is in the config (default)
- Check browser console for WebSocket errors

### Mobile app cannot connect

- For Ingress: Use HA external URL
- For direct: Enable port 13378 in add-on network settings
- Check firewall rules on your network
