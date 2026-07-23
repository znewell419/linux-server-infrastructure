# Caddy Reverse Proxy

This directory contains sanitized examples of the Caddy configuration used in my Linux server homelab.

Caddy serves as the local web server and reverse proxy for the environment, routing traffic received through Cloudflare Tunnel to the appropriate internal services.

## Responsibilities

- Serve the portfolio website
- Reverse proxy internal services
- Route requests to Docker containers
- Apply HTTP security headers
- Provide a simple, modular web server configuration

## Configuration

| File | Purpose |
|------|---------|
| `Caddyfile.example` | Main Caddy configuration |
| `conf.d/` | Modular service-specific reverse proxy configurations |

## Example Services

- Portfolio website
- Grafana
- Uptime Kuma

## Security

This repository contains **sanitized example configurations** only.

Production deployment includes:

- Cloudflare Tunnel for secure remote access
- Cloudflare Zero Trust Access for authentication
- Services bound to localhost where appropriate
- No publicly exposed service ports

## Related Components

- Docker
- Cloudflare Tunnel
- Cloudflare Zero Trust Access
- Prometheus
- Grafana
- Uptime Kuma

---

> **Note:** Domain names, filesystem paths, and other environment-specific values have been replaced with generic examples for security and portability.
