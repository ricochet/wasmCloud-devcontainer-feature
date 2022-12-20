#!/bin/sh
set -e

echo "Installing Cosmonic Shell"
bash -c "$(curl -fsSL https://cosmonic.sh/install.sh)"
echo 'export PATH=$HOME/.cosmo/bin:$PATH' >> $HOME/.zshrc
echo 'export PATH=$HOME/.cosmo/bin:$PATH' >> $HOME/.bashrc
