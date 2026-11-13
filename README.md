# homelab-infrastructure
A place to document my personal homelab services, and the IaC I use to set them up.

## Architecture

The homelab is built around Proxmox VE, which hosts virtual machines and containerized services.

Infrastructure provisioning and configuration management are handled through Terraform and Ansible.

**Core Technologies**
- **Virtualization:** Proxmox VE
- **Infrastructure as Code:** Terraform
- **Configuration Management:** Ansible
- **Containerization:** Docker / Docker Compose
- **CI/CD:** GitHub Actions with a self-hosted runner
- **Operating Systems:** Ubuntu Server, Linux

## Repository Structure

```text
homelab-infrastructure/
├── ansible/
│   ├── inventories/
│   │   └── example/
│   ├── playbooks/
│   ├── roles/
│   └── ansible.cfg
├── terraform/
├── docker/
│   └── services/
├── scripts/
├── .github/
│   └── workflows/

├── .gitignore
└── README.md
```

## CI/CD Pipeline

This project uses two GitHub repositories to separate public infrastructure code from private deployment configuration.

**Public Repository**
- Stores reusable infrastructure code, documentation, and example configurations.
- Runs linting, validation, and security checks.
- Does not contain production credentials or sensitive configuration.

**Private Repository**
- Contains deployment workflows and environment-specific configuration.
- Uses a dedicated self-hosted GitHub Actions runner.
- Deploys reviewed and approved infrastructure changes to the homelab.

Deployment workflows are manually triggered and use pinned versions of public infrastructure code.

## Getting Started

### Prerequisites

- Proxmox VE environment
- Ansible
- Terraform
- SSH access to managed Linux hosts
- Appropriate infrastructure permissions

### Ansible Examples

Check inventory connectivity:

```bash
ansible all -i inventory.ini -m ping
```

Validate playbook syntax:

```bash
ansible-playbook playbooks/site.yml --syntax-check
```

Preview changes:

```bash
ansible-playbook -i inventory.ini playbooks/site.yml --check --diff
```

Execute a playbook:

```bash
ansible-playbook -i inventory.ini playbooks/site.yml
```

Replace `inventory.ini` with your actual inventory path.

## Documentation

| Document | Description |
|---|---|
| [Ansible Cheat Sheet](docs/guides/ansible-cheatsheet.md) | Common commands, modules, and troubleshooting |


## Roadmap

- [ ] Establish Proxmox infrastructure
- [ ] Configure Ansible inventories and roles
- [ ] Develop reusable Terraform modules
- [ ] Deploy dedicated GitHub Actions runner
- [ ] Implement automated infrastructure validation
- [ ] Configure private deployment workflows
- [ ] Add monitoring and observability

## Disclaimer

This repository documents a personal homelab environment intended for educational and experimental purposes. Configuration examples should be reviewed and adapted before use in other environments.