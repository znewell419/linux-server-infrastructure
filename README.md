# Linux Server Infrastructure Homelab

A self-hosted Linux server environment built to develop hands-on experience with system administration, networking, security, automation, and monitoring.

This project documents the design, deployment, security hardening, and ongoing maintenance of a Linux-based infrastructure environment.

## Hardware

- Dell PowerEdge T420
- Arch Linux Server
- PERC H310 RAID Controller
- Headless server environment

## Services

- Docker / Docker Compose
- Caddy reverse proxy
- Cloudflare Tunnel
- Cloudflare Zero Trust Access
- Uptime Kuma monitoring
- Prometheus metrics collection
- Grafana dashboards
- cAdvisor container monitoring

## Architecture

This infrastructure uses a layered approach:

- **Cloudflare Tunnel** provides secure external access without exposing inbound service ports.
- **Caddy** handles reverse proxy routing.
- **Docker** manages application deployment and service isolation.
- **Prometheus** collects system and container metrics.
- **Grafana** provides visualization and dashboards.
- **Uptime Kuma** monitors service availability and uptime.

## Security

Implemented:

- SSH key authentication
- Password authentication disabled
- Remote administration through Tailscale
- No publicly exposed service ports
- Cloudflare Zero Trust Access protection
- Services isolated through Docker containers
- Credentials and sensitive information excluded from version control

## Monitoring

Implemented:

- Public service uptime monitoring
- Server heartbeat monitoring
- Prometheus node metrics
- Grafana dashboards
- Container monitoring through cAdvisor

## Deployment

Services are deployed using Docker Compose and managed through Linux system administration practices.

Deployment workflow:

1. Configure and maintain the Linux server environment
2. Harden SSH access and remote administration
3. Deploy containerized services
4. Configure reverse proxy routing
5. Secure external access through Cloudflare Tunnel
6. Implement monitoring and alerting

## Repository Structure

## Repository Structure

| Directory | Description |
|-----------|-------------|
| `caddy/` | Reverse proxy configuration examples and documentation |
| `cloudflare/` | Cloudflare Tunnel configuration examples |
| `docker/` | Docker Compose deployments and service configurations |
| `docs/` | System administration documentation and guides |
| `monitoring/` | Monitoring documentation and configuration references |
| `scripts/` | Bash automation and system maintenance scripts |
| `uptime-kuma/` | Uptime monitoring documentation |

## Lessons Learned

Through this project, I have gained hands-on experience with:

- Linux server administration
- Docker and container management
- Reverse proxy configuration
- DNS and HTTPS concepts
- Secure remote access
- Monitoring and observability
- Infrastructure troubleshooting
- Bash automation

## Purpose

This project serves as a portfolio demonstration of my continued development in Linux systems administration and infrastructure management.
