# SSH Hardening

## Overview

This server uses SSH key-based authentication and Tailscale for secure remote administration.

## Configuration

Security settings:

- Password authentication disabled
- Root login disabled
- Public key authentication enabled
- SSH access limited through Tailscale network

## Key Management

Authorized keys are stored in: ~/.ssh/authorized_keys

Multiple trusted devices are configured:

- Laptop

- Mobile device

## Troubleshooting

Verify SSH configuration:

sudo sshd -T

Check authentication logs:

sudo journalctl -u sshd


