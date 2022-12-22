#!/bin/sh
set -e

cargo install wash-cli

WASMCLOUD_VERSION=${VERSION:-"v0.59.0"}
if [ "${VERSION}" = "latest" ]; then
    WASMCLOUD_VERSION="v0.59.0"
fi

arch="$(uname -m)"; \
case "$arch" in \
  arm64) wasmCloudArch='aarch64';; \
  aarch64) wasmCloudArch='aarch64';; \
  armv8b) wasmCloudArch='aarch64';; \
  armv8l) wasmCloudArch='aarch64';; \
  x86_64) wasmCloudArch='x86_64';; \
  *) echo >&2 "error: $arch is not supported!"; exit 1 ;; \
esac;

wget -O wasmcloud.tar.gz https://github.com/wasmCloud/wasmcloud-otp/releases/download/${WASMCLOUD_VERSION}/${wasmCloudArch}-linux.tar.gz
mkdir -p /usr/local/wasmcloud
tar -xvf wasmcloud.tar.gz -C /usr/local/wasmcloud
rm -rf wasmcloud.tar.gz
ln -s "/usr/local/wasmcloud/bin/wasmcloud_host" /usr/local/bin/wasmcloud_host
