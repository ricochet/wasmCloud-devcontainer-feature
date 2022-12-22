
# Rust toolchain updates for building with Wasm

A feature for updating the Rust toolchain updates for building with Wasm.
This feature is only compatible with the Rust base.

## Example Usage

```json
"features": {
    "ghcr.io/ricochet/wasmCloud-devcontainer-feature/rust-wasm:1": {
        "version": "latest"
    }
}
```

```bash
cargo generate --git https://github.com/wasmCloud/new-actor-template
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of NATS Server to install. | string | latest |

---
