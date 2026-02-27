# Changelog

This changelog tracks Senseware-specific deltas from upstream `swarmpit/swarmpit`.

## 2026-02-27

### Fork Baseline and Compatibility Update

- Added Senseware fork documentation and ownership context in `README.md`.
- Set default Docker API target to `1.52` (Docker v29.0 API level) in runtime config.
- Documented daemon compatibility minimum of Docker API `1.44`.
- Updated stack defaults to pass `SWARMPIT_DOCKER_API=1.52` and `DOCKER_API_VERSION=1.52`.
- Updated stack image defaults to Senseware GHCR images:
  - `ghcr.io/senseware/swarmpit:latest`
  - `ghcr.io/senseware/swarmpit-agent:latest`
- Updated local/dev helper scripts to modern Docker API defaults.
- Updated embedded Docker CLI install default from `19.03.5` to `29.0.0`.
- Modernized GitHub Actions workflow for current action versions and GHCR publishing.
- Updated manual install examples and links to Senseware repositories and images.
