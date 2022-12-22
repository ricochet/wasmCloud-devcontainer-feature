#!/bin/sh
set -e

# COSMO_VERSION
export COSMO_VERSION="${VERSION:-latest}"
echo "Installing Cosmonic Shell"
bash -c "$(curl -fsSL https://cosmonic.sh/install.sh)"
ln -s "${HOME}/bin/cosmo" /usr/local/bin/cosmo
