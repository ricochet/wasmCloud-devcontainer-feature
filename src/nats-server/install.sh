#!/bin/sh
set -eux

# Based on NATS Dockerfile
# https://github.com/nats-io/nats-docker/blob/main/2.9.10/alpine3.17/Dockerfile

NATS_VERSION=$VERSION
if [ "${VERSION}" = "latest" ] || [ "${VERSION}" = "lts" ]; then
    NATS_VERSION="2.9.10"
fi

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

arch="$(uname -m)"; \
case "$arch" in \
  aarch64) natsArch='arm64'; sha256='6e1378b40ff5b70fa664c885d5dad88daf0d6040d48c864e0e92a3f19565613a' ;; \
  armhf) natsArch='arm6'; sha256='cae799c7aec05671b0f9b11fd5eaa347a59e7b53351f74aafecf2a19560ef503' ;; \
  armv7) natsArch='arm7'; sha256='7eb3de1f7c1aa437b0b92f7caec3206739a28fe3fec8e335b13cad6570ee7ca5' ;; \
  x86_64) natsArch='amd64'; sha256='1dc0829c9cddbc9474a768853d464bd8b32cdaa51f66633825a20462b36071c8' ;; \
  x86) natsArch='386'; sha256='853990c198be636d6b99bf3bfedb75804c51bbf376a7c381aab52ac8add2f2ca' ;; \
  *) echo >&2 "error: $arch is not supported!"; exit 1 ;; \
esac;

wget -O nats-server.tar.gz "https://github.com/nats-io/nats-server/releases/download/v${NATS_VERSION}/nats-server-v${NATS_VERSION}-linux-${natsArch}.tar.gz";
echo "${sha256} *nats-server.tar.gz" | sha256sum -c -;

check_packages ca-certificates

tar -xf nats-server.tar.gz;
rm nats-server.tar.gz;
mv "nats-server-v${NATS_VERSION}-linux-${natsArch}/nats-server" /usr/local/bin;
rm -rf "nats-server-v${NATS_VERSION}-linux-${natsArch}";
