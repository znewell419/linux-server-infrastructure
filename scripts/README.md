# System Maintenance Scripts

A collection of Bash scripts created to automate common Linux system administration tasks, including system updates, cleanup, health monitoring, and routine maintenance.

These scripts were created as part of my Linux server administration homelab to practice automation, system management, monitoring, and scripting best practices.

## Available Scripts

## Debian / Ubuntu System Maintenance

**File:**

```text
debian-system-maintenance.sh
```

Designed for Debian-based distributions.

Features:

- Updates package repositories
- Installs available system updates
- Removes unused packages
- Cleans package cache
- Performs safe temporary file cleanup using systemd-tmpfiles

Requirements:

- Debian or Ubuntu-based Linux distribution
- User with sudo privileges

Run:

```bash
chmod +x debian-system-maintenance.sh
./debian-system-maintenance.sh
```

---

## Arch Linux System Maintenance

**File:**

```text
arch-system-maintenance.sh
```

Designed for Arch Linux systems.

Features:

- Performs full system updates using pacman
- Removes orphaned packages
- Cleans temporary files using systemd-tmpfiles
- Includes basic error handling

Requirements:

- Arch Linux installation
- User with sudo privileges

Run:

```bash
chmod +x arch-system-maintenance.sh
./arch-system-maintenance.sh
```

---

## Linux Server Health Check

**File:**

```text
health-check.sh
```

A system health monitoring script designed to provide a quick overview of server status and identify potential issues.

Features:

- Displays hostname and system information
- Reports kernel version
- Checks system uptime
- Displays CPU load and memory usage
- Monitors disk usage
- Detects failed systemd services
- Checks Docker service status
- Displays running Docker containers
- Verifies important services:
  - SSH
  - Caddy
  - Cloudflared
- Uses exit codes for future automation and monitoring integration

Exit codes:

```text
0 = Healthy
1 = Issues detected
```

Requirements:

- Linux system using systemd
- User with sudo privileges
- Docker installed (for Docker status checks)

Run:

```bash
chmod +x health-check.sh
./health-check.sh
```

---

## Purpose

These scripts were created to automate routine Linux system administration tasks and demonstrate practical experience with:

- Bash scripting
- Linux package management
- System maintenance automation
- Server health monitoring
- Docker administration
- Administrative scripting workflows

They are part of my Linux server infrastructure homelab project and serve as examples of automation used to maintain and monitor Linux systems.
