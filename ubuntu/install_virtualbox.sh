#!/bin/bash

# https://www.virtualbox.org/

echo "virtualbox Starting installation"

echo "Adding virtualbox GPG Key"
# Add the GPG key for the official virtualbox repository to the system
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo "Adding virtualbox Repository"
# Add the Docker repository to APT sources
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" > /etc/apt/sources.list.d/virtualbox.list'

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing dkms"
# Install the dkms package to ensure that the VirtualBox host kernel modules (vboxdrv, vboxnetflt and vboxnetadp) are properly updated if the linux kernel version changes
sudo apt install -y dkms

echo "Installing dependencies"
# Install libpng12-0_1.2.50-2+deb8u2_amd64.deb
#wget http://http.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u2_amd64.deb
#sudo dpkg -i libpng12-0_1.2.50-2+deb8u2_amd64.deb
#rm libpng12-0_1.2.50-2+deb8u2_amd64.deb

echo "Installing virtualbox"
# Install virtualbox
sudo apt install -y virtualbox-5.1

echo "Adding users to vboxusers"
# To access USB devices from VirtualBox guests, add users to vboxusers
sudo usermod -a -G vboxusers $(whoami)
# To access Shared Folder from VirtualBox guests, add users to vboxsf
sudo usermod -a -G vboxsf $(whoami)

# Install Extension pack
echo "Installing virtualbox Extension pack"
version=$(vboxmanage -v)
echo $version
var1=$(echo $version | cut -d 'r' -f 1)
echo $var1
var2=$(echo $version | cut -d 'r' -f 2)
echo $var2
file="Oracle_VM_VirtualBox_Extension_Pack-$var1-$var2.vbox-extpack"
echo $file
wget http://download.virtualbox.org/virtualbox/$var1/$file -O /tmp/$file
#sudo VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
sudo vboxmanage extpack install /tmp/$file --replace
# Remove tmp file
sudo rm /tmp/$file

echo "virtualbox Installation Done"
