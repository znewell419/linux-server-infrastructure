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

### ZDN Server Health Check

**File:**

```text
zdn-health-check.sh
```

A server health monitoring script designed to provide a quick overview of system status and identify potential issues.

The script is used by the `zdn-health.service` systemd service and runs automatically through `zdn-health.timer` every five minutes.

#### Features

- Displays hostname and system information
- Reports kernel version
- Checks system uptime
- Displays CPU load and memory usage
- Monitors root filesystem usage
- Detects failed systemd services
- Checks Docker service status
- Displays the number of running Docker containers
- Verifies important services:
  - SSH
  - Caddy
  - Cloudflared
- Verifies that the server heartbeat has successfully completed within the last 10 minutes
- Uses exit codes for automation and monitoring integration
- Logs health check output to `/var/log/zdn-health.log`

#### Heartbeat Monitoring

The health check includes a dedicated heartbeat check to prevent false positives caused by historical systemd failure states.

Because `heartbeat.service` is a oneshot service, systemd may retain a previous failure state even after a subsequent heartbeat succeeds. The health check therefore verifies recent successful heartbeat executions rather than relying solely on the service's current systemd state.

The heartbeat runs approximately once per minute through `heartbeat.timer`. A successful heartbeat within the previous 10 minutes is considered healthy.

#### Exit Codes

```text
0 = Healthy
1 = Issues detected
```

#### Requirements

- Linux system using systemd
- User with sudo privileges
- Docker installed for Docker status checks
- `heartbeat.service` and `heartbeat.timer` configured if heartbeat monitoring is desired

#### Run Manually

```bash
chmod +x zdn-health-check.sh
./zdn-health-check.sh
```

The production health check is installed at:

```text
/usr/local/bin/zdn-health-check.sh
```

and is executed automatically by systemd.

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
