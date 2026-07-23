# Cloudflare

This directory contains sanitized examples of the Cloudflare configuration used in my Linux server homelab.

Cloudflare provides the secure public entry point for the environment. Rather than exposing services directly to the internet, traffic is routed through a Cloudflare Tunnel to the internal web server.

## Components

- Cloudflare DNS
- Cloudflare Tunnel
- Cloudflare Zero Trust Access

## Architecture

Internet
    │
    ▼
Cloudflare DNS
    │
    ▼
Cloudflare Tunnel
    │
    ▼
Caddy Reverse Proxy
    │
    ├── Portfolio Website
    ├── Grafana
    └── Uptime Kuma`

## Security

This deployment is designed to minimize internet exposure.

- No inbound ports are forwarded from the router.
- Internal services are accessed through Cloudflare Tunnel.
- Administrative applications can be protected with Cloudflare Zero Trust Access.
- Example configuration files have been sanitized for public release.

## Related Components

- Caddy
- Docker
- Grafana
- Prometheus
- Uptime Kuma
