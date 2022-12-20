#!/bin/sh
set -eux

WASI_VERSION=$VERSION
if [ "${VERSION}" = "latest" ] || [ "${VERSION}" = "lts" ]; then
    WASI_VERSION="17"
fi

export WASI_VERSION_FULL=${WASI_VERSION}.0
wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_VERSION}/wasi-sdk-${WASI_VERSION_FULL}-linux.tar.gz
tar xvf wasi-sdk-${WASI_VERSION_FULL}-linux.tar.gz
rm wasi-sdk-${WASI_VERSION_FULL}-linux.tar.gz
mv "wasi-sdk-${WASI_VERSION_FULL}-linux" /opt/wasi-sdk
