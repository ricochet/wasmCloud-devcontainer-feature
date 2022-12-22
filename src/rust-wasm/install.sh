#!/bin/sh
set -e

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

check_packages ca-certificates

rustup target add wasm32-unknown-unknown
rustup target add wasm32-wasi

cargo install --git https://github.com/bytecodealliance/cargo-component
