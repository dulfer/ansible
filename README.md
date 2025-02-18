# Ansible

This repository contains Ansible playbooks and roles for managing configuration in my home lab environment. The structure is designed to facilitate easy organization and reuse of roles and tasks across different servers.

## Project Structure

```text
📂 ansible
├── 📂playbooks
│   ├── site.yml                    # Main playbook for orchestration
│   └── 📂roles                     # Directory for Ansible roles
│       ├── 📂common                # Common role for shared configurations
│       │   ├── 📂tasks
│       │   │   └──main.yml          # <-- tasks file can include smaller files if warranted
│       │   ├── 📂handlers
│       │   │   └──main.yml          # Handlers for the common role
│       │   ├── 📂templates         # Jinja2 templates for the common role
│       │   ├── 📂files             # Static files for the common role
│       │   ├── 📂vars
│       │   │   └──main.yml         # Variables for the common role
│       │   ├── 📂defaults
│       │   │   └──main.yml         # Default variables for the common role
│       │   ├── 📂meta
│       │   │   └──main.yml         # Metadata for the common role
│       │   └── 📄README.md           # Documentation for the common role
│       │
│       └── 📂other_role            # Other role for web server configuration
│           
├── 📂inventory                     # Inventory files for different environments
│   ├── 📂production                # Production environment inventory
│   └── 📂staging                   # Staging environment inventory
|
├── 📂group_vars                    # Group variable files
│   ├── all.yml                     # Variables for all hosts
│   └── others.yml                  # Variables for other group
|
├── 📂host_vars                    # Host-specific variable files
│   ├── server1.yml                 # Variables for server1
│   └── server2.yml                 # Variables for server2
|
├── 📂library/                     # custom modules (optional)
├── 📂module_utils/                # custom module_utils to support modules (optional)
├── 📂filter_plugins/              # custom filter plugins (optional)
|
├── ⚙️ansible.cfg                     # Ansible configuration file
└── 📄README.md                       # Project documentation
```

## Setup

### Debian Linux

## Bitwarden/Vaultwarden secrets management

Instead of storing secrets in Ansible Vault, these can also be stored in an external secrets manager like Bitwarden Secrets Manager.

🔗 <https://docs.ansible.com/ansible/latest/collections/community/general/bitwarden_lookup.html>

### Usage

1. Modify the inventory files to include server
2. Update the group and host variable files as necessary
3. Set BitWarden access token as environment variable, so playbook can connect to the vault

    ```bash
    export BWS_ACCESS_TOKEN=<ACCESS_TOKEN_VALUE>
    ```

4. Run the main playbook using the command:

    ```bash
    ansible-playbook playbooks/site.yml
    ```

This will apply the configurations defined in the playbooks and roles to the home lab environment
