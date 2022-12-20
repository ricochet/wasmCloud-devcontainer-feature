#!/bin/sh
set -e

git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
# Download and install the latest SDK tools.
./emsdk install "${VERSION}"

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
./emsdk activate "${VERSION}"

# Activate PATH and other environment variables in the current terminal
source ./emsdk_env.sh