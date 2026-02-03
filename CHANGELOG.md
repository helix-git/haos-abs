# Changelog

## [1.1.2](https://github.com/helix-git/haos-abs/compare/v1.1.1...v1.1.2) (2026-02-03)


### Bug Fixes

* Remove bashio install - already in HA base image ([656a7da](https://github.com/helix-git/haos-abs/commit/656a7da634cda70f43af350a3f8eb4475f4c57a0))

## [1.1.1](https://github.com/helix-git/haos-abs/compare/v1.1.0...v1.1.1) (2026-02-03)


### Bug Fixes

* Multi-stage build with HA base image + auto-update workflow ([6db3925](https://github.com/helix-git/haos-abs/commit/6db3925a8f383cdce452b7299d96073104299603))

## [1.1.0](https://github.com/helix-git/haos-abs/compare/v1.0.0...v1.1.0) (2026-02-03)


### Features

* Enable dispatch notification to haos-apps ([dfef1f5](https://github.com/helix-git/haos-abs/commit/dfef1f5507e9638d658a36529284201f2a8a377f))


### Bug Fixes

* Permission denied - use chmod a+x and simplify config ([08095a8](https://github.com/helix-git/haos-abs/commit/08095a8b16d71f9bf6f35dd892f363b489878b65))

## 1.0.0 (2026-02-03)


### Features

* Initial Audiobookshelf add-on for Home Assistant ([ddd17a9](https://github.com/helix-git/haos-abs/commit/ddd17a9d28ed3cab87c23d623af8178496b53b1a))

## [0.1.0](https://github.com/helix-git/haos-abs/releases/tag/v0.1.0) (2025-02-02)

### Features

* Initial release
* Wraps official Audiobookshelf Docker image v2.32.1
* Home Assistant Ingress support with WebSocket streaming
* Optional external port for mobile apps
* HA Network Storage integration for NAS access
