#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'wasi-sdk' feature with no options.
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "wasi-sdk": {}
#    }
# }
#
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test \ 
#                   --features wasi-sdk \
#                   --base-image mcr.microsoft.com/devcontainers/base:ubuntu .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

ls /opt/wasi-sdk

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "clang" bash -c "ls /opt/wasi-sdk/bin | grep 'clang'"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults