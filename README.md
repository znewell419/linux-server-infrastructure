# Linux Server Infrastructure Homelab

A self-hosted Linux server environment built to practice system administration, networking, security, automation, and monitoring.

This project documents the design, deployment, and maintenance of a Linux-based infrastructure environment while developing hands-on systems administration skills.

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
- Prometheus metrics
- Grafana dashboards

## Architecture

This infrastructure uses a layered approach:

- Cloudflare Tunnel provides secure external access without exposing inbound service ports.
- Caddy handles reverse proxying and HTTPS management.
- Docker manages application services and deployment.
- Prometheus collects system and container metrics.
- Grafana provides visualization and dashboards.
- Uptime Kuma monitors service availability and uptime.

## Security

Implemented:

- SSH key authentication
- Password authentication disabled
- Remote administration through Tailscale
- No publicly exposed service ports
- Cloudflare Access protection
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

## Lessons Learned

Through this project, I have gained hands-on experience with:

- Linux server administration
- Docker and container management
- Reverse proxy configuration
- DNS and HTTPS concepts
- Secure remote access
- Monitoring and observability
- Troubleshooting infrastructure issues

## Purpose

This project documents my ongoing work building and maintaining a Linux-based infrastructure environment while developing systems administration skills.
