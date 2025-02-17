# Ansible

This repository contains Ansible playbooks and roles for managing configuration in my home lab environment. The structure is designed to facilitate easy organization and reuse of roles and tasks across different servers.

## Project Structure

```text
📂 ansible
├── 📂playbooks
│   ├── site.yml                    # Main playbook for orchestration
│   └── 📂roles                     # Directory for Ansible roles
│       ├── 📂common                # Common role for shared configurations
│       │   ├── tasks/main.yml      # Main tasks for the common role
│       │   ├── handlers/main.yml   # Handlers for the common role
│       │   ├── templates/          # Jinja2 templates for the common role
│       │   ├── files/              # Static files for the common role
│       │   ├── vars/main.yml       # Variables for the common role
│       │   ├── defaults/main.yml   # Default variables for the common role
│       │   ├── meta/main.yml       # Metadata for the common role
│       │   └── README.md           # Documentation for the common role
│       └── 📂other_role            # Other role for web server configurations
│           ├── tasks/main.yml      # Main tasks for the other role
│           ├── handlers/main.yml   # Handlers for the other role
│           ├── templates/          # Jinja2 templates for the other role
│           ├── files/              # Static files for the other role
│           ├── vars/main.yml       # Variables for the other role
│           ├── defaults/main.yml   # Default variables for the other role
│           ├── meta/main.yml       # Metadata for the other role
│           └── README.md           # Documentation for the other role
├── 📂inventory                     # Inventory files for different environments
│   ├── 📂production                # Production environment inventory
│   └── 📂staging                   # Staging environment inventory
├── 📂group_vars                    # Group variable files
│   ├── all.yml                     # Variables for all hosts
│   └── others.yml                  # Variables for other group
├── 📂host_vars                    # Host-specific variable files
│   ├── server1.yml                 # Variables for server1
│   └── server2.yml                 # Variables for server2
├── ansible.cfg                     # Ansible configuration file
└── README.md                       # Project documentation
```

## Setup

### Debian Linux

While Ansible is available from the main Debian repository, it can be out of date. To get a more recent version, Debian users can use the Ubuntu PPA according to the following table:

| Debian | Unbuntu | UBUNTU_CODENAME |
| --- | --- | --- |
| Debian 12 (Bookworm)  | Ubuntu 22.04 (Jammy) | `jammy`  |
| Debian 11 (Bullseye)  | Ubuntu 20.04 (Focal) | `focal`  |
| Debian 10 (Buster)    | Ubuntu 18.04 (Bionic)| `bionic` |

Prior to installation, ensure wget and gpg are installed.

```bash
sudo apt install wget gpg
```

Add the Ubuntu repository and install Ansible.  
Set `UBUNTU_CODENAME` based on the table above.

```bash
# set codename
UBUNTU_CODENAME=jammy

# Download keyring
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg

# add new Ubuntu sources.list
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ansible.list

# Update apt and install ansible
sudo apt update 
sudo apt install ansible
```

### Usage

1. Modify the inventory files to include server
2. Update the group and host variable files as necessary
3. Run the main playbook using the command:

```bash
ansible-playbook playbooks/site.yml
```

This will apply the configurations defined in the playbooks and roles to the home lab environment