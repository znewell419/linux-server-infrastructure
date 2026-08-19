# Ansible Server Infrastructure

Ansible project for automating and managing the configuration of my Arch Linux home server.

The project is designed to provide repeatable, consistent, and documented server configuration through infrastructure as code.

## Overview

This project uses Ansible from a WSL2 Ubuntu control node on my Windows laptop to manage an Arch Linux home server.

The server hosts several services and applications, including a Caddy web server, Docker containers, monitoring services, and security-related services.

Ansible is used to automate system configuration and reduce the need for manual configuration directly on the server.

## Goals

The primary goals of this project are:

- Automate repeatable server configuration
- Maintain consistent system configuration
- Reduce manual configuration
- Make configuration changes auditable through Git
- Make the server easier to rebuild or recover
- Provide a documented infrastructure-as-code project
