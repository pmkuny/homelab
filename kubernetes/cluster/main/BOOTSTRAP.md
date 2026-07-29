# Cluster Secrets

## Manual Bootstrapping

| Secret | Type | Fields | Notes|
|-|-|-|-|
| ghcr-token | docker-registry | `--docker-password` |For syncing website artifact from Github Container Registry|
| cloudflared-tunnel-token | Generic | `$key` [`token`] | Cloudflare Tunnels |
| bw-auth-token | Generic | `$key` [`token`] | Auth token for BW Secrets Manager |
| grafana-loki-secrets | Generic | `values.yaml` | Secret field config for Grafana Loki. Bucket names, etc. See Loki config |
