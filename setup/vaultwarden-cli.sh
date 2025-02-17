#!/bin/bash

# ensuring curl is installed
sudo apt install curl -y

# download latest bitwarden cli
curl -L "https://vault.bitwarden.com/download/?app=cli&platform=linux" > /tmp/bw.zip

# unzip and move to /usr/local/bin
unzip /tmp/bw.zip -d /tmp
sudo mv /tmp/bw /usr/local/bin

# make executable
sudo chmod +x /usr/local/bin/bw

# cleanup
rm /tmp/bw.zip
