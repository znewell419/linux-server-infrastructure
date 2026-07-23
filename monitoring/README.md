# Monitoring Stack

This server uses a self-hosted monitoring stack to track uptime, system health, and resource usage.

## Components

### Uptime Kuma

Purpose:
- External uptime monitoring
- Service availability checks
- Server heartbeat monitoring

Features:
- HTTP monitors
- Push heartbeat monitoring
- Status page

### Prometheus

Purpose:
- Collects time-series metrics

Current exporters:
- Node Exporter
- cAdvisor

### Grafana

Purpose:
- Visualization and dashboards

Dashboards display:
- CPU usage
- Memory usage
- Disk utilization
- Container metrics

## Architecture

Server
|
|– Node Exporter
|
|– cAdvisor
|
|– Prometheus
|
|– Grafana
|
|– Uptime Kuma

## Security

Access is protected using:

- Cloudflare Tunnel
- Cloudflare Zero Trust Access
- No publicly exposed service ports
