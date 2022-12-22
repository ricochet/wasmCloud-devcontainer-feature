#!/bin/sh
set -e

os="$(uname -s | tr '[:upper:]' '[:lower:]')"
arch="$(uname -m)"

# arm64 and aarch64 are the same binary
if [ "$arch" = "arm64" ]; then
  arch="aarch64"
fi

COSMO_VERSION="${VERSION:-latest}"
url="https://cosmonic.sh/cosmo-${arch}-${os}-${COSMO_VERSION}"
wget -O cosmo "${url}"
chmod +x cosmo
mv "cosmo" /usr/local/bin