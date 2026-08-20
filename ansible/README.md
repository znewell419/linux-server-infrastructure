# Ansible Server Automation

Ansible project for automating the configuration and management of a Linux home server.

The project uses Ansible from a WSL2 Ubuntu control node to manage an Arch Linux server. It provides repeatable configuration, security hardening, service management, package management, Docker configuration, and web server configuration.

## Purpose

This project was created to replace repetitive manual server configuration with infrastructure-as-code practices.

The goals are to:

- Automate repeatable server configuration
- Maintain consistent system configuration
- Reduce manual configuration
- Make configuration changes auditable through Git
- Simplify server maintenance
- Improve recovery and rebuild capabilities
- Provide hands-on experience with Ansible and infrastructure as code

## Architecture

The Ansible control node is a WSL2 Ubuntu environment running on a Windows laptop.

Ansible connects to the managed Linux server over SSH using key-based authentication.

## Project Structure

```text
Windows Laptop
|
v
WSL2 Ubuntu
|
v
Ansible
|
| SSH
v
Linux Server
```
The Ansible project is stored in the `ansible/` directory of the larger Linux server infrastructure repository.

```text
ansible/
├── ansible.cfg
├── inventory.ini
├── inventory.example.ini
├── group_vars/
│ ├── servers.yml
│ └── webservers.yml
├── playbooks/
│ ├── base-server.yml
│ ├── configuration-management.yml
│ ├── docker.yml
│ ├── handlers.yml
│ ├── package-check.yml
│ ├── package-management.yml
│ ├── server-info.yml
│ ├── service-management.yml
│ ├── site.yml
│ ├── template-management.yml
│ ├── webserver-info.yml
│ └── webserver-role.yml
├── roles/
│ ├── base_server/
│ ├── docker/
│ ├── fail2ban/
│ ├── ssh/
│ └── webserver/
└── templates/
 └── server-info.j2
```

## Inventory

The Ansible inventory defines the managed hosts and their group membership.

The real `inventory.ini` file is intentionally excluded from version control because it contains environment-specific configuration.

A sanitized example is provided as:

```text
inventory.example.ini
```

To create a local inventory:

```bash
cp inventory.example.ini inventory.ini
```

The local inventory should then be configured for the target environment.

## Configuration

Ansible configuration is stored in:

```text
ansible.cfg
```

The configuration defines project-specific Ansible behavior and settings.

## Playbooks

The project contains several playbooks, each focused on a specific area of server management.

### `site.yml`

The primary playbook used to apply the server configuration.

### `base-server.yml`

Handles baseline server configuration and required packages.

### `package-management.yml`

Manages required system packages.

### `package-check.yml`

Checks package state and verifies required packages.

### `configuration-management.yml`

Manages general server configuration.

### `service-management.yml`

Manages system services.

### `docker.yml`

Installs and configures Docker-related components.

### `webserver-role.yml`

Applies the web server role.

### `webserver-info.yml`

Manages web server information and related configuration.

### `template-management.yml`

Manages configuration generated from Ansible templates.

### `server-info.yml`

Deploys server information using an Ansible template.

### `handlers.yml`

Contains handler-related configuration used by the project.

## Roles

The project uses Ansible roles to organize reusable configuration.

### `base_server`

Provides baseline server configuration and required packages.

### `docker`

Handles Docker installation and configuration.

### `fail2ban`

Installs and configures Fail2ban for SSH protection.

### `ssh`

Manages SSH hardening configuration.

### `webserver`

Manages web server configuration, including Caddy configuration and related templates.

## Templates

Jinja2 templates are used to generate configuration files dynamically.

Templates are located within individual roles when they are specific to that role. Shared project templates are stored in:

```text
templates/
```

Examples include:

- SSH hardening configuration
- Fail2ban configuration
- Caddy configuration
- Server information

## Requirements

### Control Node

The Ansible control node requires:

- WSL2 with Ubuntu
- Ansible
- Git
- SSH client
- Network connectivity to the managed server

### Managed Server

The managed server requires:

- Linux operating system
- Python 3
- SSH server
- SSH key-based authentication
- A user account with `sudo` privileges

### SSH Access

The control node must be able to establish SSH access to the managed server using an authorized SSH key.

The private key should remain on the control node and must not be committed to version control.

## Usage

Run Ansible commands from the `ansible/` directory.

### Test Connectivity

Verify that Ansible can connect to the managed server:

```bash
ansible -i inventory.ini servers -m ansible.builtin.ping
```

### Syntax Check

Check a playbook for syntax errors before applying changes:

```bash
ansible-playbook -i inventory.ini playbooks/site.yml --syntax-check
```

### Apply Configuration

Run the main site playbook:

```bash
ansible-playbook -i inventory.ini playbooks/site.yml
```

If administrative privileges are required, run:

```bash
ansible-playbook -i inventory.ini playbooks/site.yml -b -K
```

The `-b` option enables privilege escalation, while `-K` prompts for the sudo password.

### Run Individual Playbooks

Individual playbooks can be run when making or testing changes to a specific area of the server:

```bash
ansible-playbook -i inventory.ini playbooks/<playbook>.yml
```

## Testing

Before applying changes to the managed server, the configuration should be tested and verified.

### Connectivity Test

Verify that Ansible can reach the managed server:

```bash
ansible -i inventory.ini servers -m ansible.builtin.ping
```

A successful response confirms that Ansible can connect to the managed server and execute modules.

### Syntax Validation

Check the syntax of a playbook before applying changes:

```bash
ansible-playbook -i inventory.ini playbooks/site.yml --syntax-check
```

A successful syntax check confirms that the playbook can be parsed by Ansible.

### Playbook Execution

After connectivity and syntax checks pass, run the appropriate playbook and review the output for errors or unexpected changes.

For the complete server configuration:

```bash
ansible-playbook -i inventory.ini playbooks/site.yml -b -K
```

Individual playbooks can be executed when testing or updating a specific area of the configuration.

### Post-Change Verification

After applying configuration changes, verify that the affected services and configuration are operating as expected.

This may include:

- Checking service status with `systemctl`
- Reviewing service logs with `journalctl`
- Verifying configuration files
- Confirming expected network connectivity
- Running Ansible checks again when appropriate
- Confirming that no unexpected changes or failures occurred

## Security

Security is an important part of the Ansible project. Configuration management is used to consistently apply and maintain security-related settings on the managed server.

### SSH Hardening

The `ssh` role manages SSH hardening configuration, including:

- Disabling root login
- Disabling password authentication
- Restricting SSH forwarding capabilities
- Disabling SSH compression
- Configuring SSH connection settings

SSH access uses key-based authentication.

### Fail2ban

The `fail2ban` role installs and configures Fail2ban to protect SSH from repeated failed authentication attempts.

The SSH jail is configured to:

- Monitor SSH authentication attempts
- Ban hosts after repeated failures
- Use systemd for log monitoring
- Apply nftables-based bans
- Automatically expire bans after the configured ban period

### Sensitive Configuration

Environment-specific configuration and credentials are excluded from version control.

The real Ansible inventory is kept locally and is not committed to the public repository.

Private SSH keys, passwords, tokens, and other credentials must never be stored in the repository.

## Maintenance

Changes to the server configuration should be made through the Ansible project whenever practical.

Recommended workflow:

1. Make the configuration change in the appropriate playbook, role, template, or variable file.
2. Run an Ansible syntax check.
3. Test connectivity to the managed server.
4. Run the relevant playbook.
5. Verify the resulting configuration and service state.
6. Review the Git diff.
7. Commit the change with a descriptive commit message.
8. Push the changes to GitHub.

This workflow keeps the server configuration reproducible, auditable, and synchronized with the infrastructure repository.

## Current Status

The Ansible project currently automates and manages:

- Baseline server configuration
- Package management
- Service management
- Docker installation and configuration
- SSH hardening
- Fail2ban installation and configuration
- Caddy web server configuration
- Server information templates
- Web server configuration
- Configuration management through Ansible roles
- Repeatable server deployment and maintenance

## Future Improvements

Potential future improvements include:

- Expand role coverage for additional server services
- Improve variable management and reduce environment-specific configuration
- Add automated testing for Ansible roles and playbooks
- Introduce Ansible Vault for managing encrypted secrets if required
- Add CI validation for YAML and Ansible syntax
- Further modularize server configuration
- Document recovery and rebuild procedures
- Expand automation for server backup and disaster recovery

## Lessons Learned

This project has provided hands-on experience with:

- Ansible configuration management
- Infrastructure-as-code practices
- YAML-based configuration
- Ansible playbooks and roles
- Jinja2 templates
- SSH-based remote administration
- Linux server administration
- Security hardening
- Service and package management
- Docker configuration
- Infrastructure troubleshooting
- Git-based configuration tracking
- Repeatable and auditable server management

## Project Workflow

The project follows a configuration-management workflow designed to keep the live server and infrastructure repository consistent.

```text
Make configuration change
 ↓
Run syntax check
 ↓
Test Ansible connectivity
 ↓
Run relevant playbook
 ↓
Verify server state
 ↓
Review Git diff
 ↓
Commit changes
 ↓
Push to GitHub
```

The live server remains the source of operational state, while the Ansible repository provides the documented and repeatable configuration used to manage that state.


## Repository and Backup

The Ansible project is maintained as part of the larger Linux Server Infrastructure repository.

The repository is hosted on GitHub to provide:

- Version control
- Configuration history
- Remote backup of the Ansible project
- A record of infrastructure changes
- A portfolio demonstration of infrastructure-as-code practices

The real Ansible inventory and other environment-specific or sensitive configuration remain excluded from the public repository.

## Related Infrastructure

This Ansible project is part of a larger self-hosted Linux server infrastructure environment.

The broader infrastructure repository includes documentation and configuration for:

- Docker and Docker Compose
- Caddy reverse proxy
- Cloudflare Tunnel
- Cloudflare Zero Trust Access
- Prometheus
- Grafana
- Uptime Kuma
- Server maintenance scripts
- Linux system administration

Ansible provides the configuration-management layer used to automate and maintain the underlying server environment.

## Conclusion

This project represents an ongoing effort to manage a Linux server using repeatable, documented, and version-controlled infrastructure practices.

Ansible provides a foundation for automating server configuration while Git provides version history and remote backup of the configuration.

The project will continue to evolve as additional services, automation, testing, and infrastructure-management practices are introduced.
