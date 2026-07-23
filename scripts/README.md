# System Maintenance Scripts

A collection of Bash scripts created to automate common Linux system administration tasks, including package updates, cleanup, and basic maintenance.

These scripts were created as part of my Linux server administration homelab to practice automation, system management, and scripting best practices.

## Available Scripts

### Debian / Ubuntu System Maintenance

**File:**
debian-system-maintenance.sh

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

chmod +x debian-system-maintenance.sh
./debian-system-maintenance.sh

## Arch Linux System Maintenance

**File:**
arch-system-maintenance.sh

Designed for Arch Linux systems.

Features:

* Performs full system updates using pacman
* Removes orphaned packages
* Cleans temporary files using systemd-tmpfiles
* Includes basic error handling

Requirements:

* Arch Linux installation
* User with sudo privileges

Run:

chmod +x arch-system-maintenance.sh
./arch-system-maintenance.sh

## Purpose

These scripts were created to automate routine Linux system administration tasks and demonstrate practical experience with:

- Bash scripting
- Linux package management
- System maintenance automation
- Safe cleanup practices
- Administrative scripting workflows

They are part of my Linux server infrastructure homelab project and serve as examples of automation used to maintain Linux systems.
