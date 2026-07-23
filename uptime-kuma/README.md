# Uptime Kuma Monitoring

Uptime Kuma is used to monitor the availability of publicly accessible services and provide status visibility for the homelab environment.

## Purpose

Uptime Kuma provides uptime monitoring separate from the services it monitors.

It is used to track:

- Website availability
- Public service uptime
- Internal service health checks
- Notification events

## Deployment

Uptime Kuma runs as a Docker container managed through Docker Compose.

Example deployment location:

docker/monitoring/docker-compose.yml

## Access

The service is not directly exposed to the internet.

Traffic flow:

Internet
|
v
Cloudflare Tunnel
|
v
Caddy Reverse Proxy
|
v
Uptime Kuma Container

## Notifications

Configured notification options may include:

- Email
- Telegram
- Other supported notification providers

## Security

Implemented:

- Local container binding
- No direct public port exposure
- Cloudflare Access protection
- Reverse proxy access
