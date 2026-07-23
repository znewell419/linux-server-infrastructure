# Monitoring Stack

Docker-based monitoring environment using:

- Prometheus
- Grafana
- Node Exporter
- cAdvisor
- Uptime Kuma

## Deployment

Start the stack:

docker compose up -d

## Components

Service | Purpose 

Grafana | Metrics Visualization

Prometheus | Metrics Collection

Node Exporter | Linux Host Metrics 

cAdvisor | Container Metrics

Uptime Kuma | Service Uptime Monitoring

## Security

Services are bound to localhost and intended to be accessed through a reverse proxy or secure tunnel.
