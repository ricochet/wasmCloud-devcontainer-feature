#!/bin/sh
set -eux

check_packages ca-certificates

rustup target add wasm32-unknown-unknown
rustup target add wasm32-wasi

cargo install --git https://github.com/bytecodealliance/cargo-component
