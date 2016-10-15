#!/bin/bash
# Node Version Manager
# https://github.com/creationix/nvm

echo "nvm Starting installation"

echo "Installing curl dependency"
sudo apt install -y curl

echo "Intalling nvm"
# This script clones the nvm repository to ~/.nvm and adds the source line to your profile (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc).
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash

echo "nvm Installation Done"
