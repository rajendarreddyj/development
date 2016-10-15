#!/bin/bash

# http://www.getdeb.net/welcome/

echo "filezilla Starting installation"

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

# Install filezilla
# https://filezilla-project.org/
sudo apt install -y filezilla
echo "filezilla Installation Done"
