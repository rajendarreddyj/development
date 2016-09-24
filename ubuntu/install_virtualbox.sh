#!/bin/bash

# https://www.virtualbox.org/

echo "virtualbox Starting installation"

echo "Adding virtualbox GPG Key"
# Add the GPG key for the official virtualbox repository to the system
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo "Adding virtualbox Repository"
# Add the Docker repository to APT sources
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing dkms"
# Install the dkms package to ensure that the VirtualBox host kernel modules (vboxdrv, vboxnetflt and vboxnetadp) are properly updated if the linux kernel version changes
sudo apt install -y dkms

echo "Installing virtualbox"
# Install virtualbox
sudo apt install -y virtualbox-5.1

echo "Adding users to vboxusers"
# To access USB devices from VirtualBox guests, add users to vboxusers
sudo usermod -a -G vboxusers $(whoami)
# To access Shared Folder from VirtualBox guests, add users to vboxsf
sudo usermod -a -G vboxsf $(whoami)

echo "virtualbox Installation Done"