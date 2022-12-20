
# NATS Server

A feature for installing NATS Server

## Example Usage

```json
"features": {
    "ghcr.io/ricochet/wasmCloud-devcontainer-feature/nats-server:1": {
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
