# Linux host setup

## Ansible

⚙️ run `./ansible-install-debian.sh`

### Script walkthrough

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

## Bitwarden CLI

The Bitwarden CLI is required to retrieve secrets from the Vaultwarden vault.  
This prevents secrets from being stored in public repositories.

Prior to installation, ensure curl is installed.

```bash
sudo apt install curl -y
```

⚙️ run `./bitwarden-cli.sh`
