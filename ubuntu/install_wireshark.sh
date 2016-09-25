#!/bin/bash

# https://www.wireshark.org/

echo "wireshark Starting installation"

echo "Intall wireshark dependency"
# add-apt-repository dependency
sudo apt install -y python3-software-properties

# echo "Adding wireshark repository"
# Add wireshark Repository
# sudo add-apt-repository ppa:wireshark-dev/stable

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing wireshark"
#install wireshark
sudo apt install -y wireshark

echo "Configuring wireshark"
# To aConfigure wireshark
sudo groupadd wireshark
sudo usermod -a -G wireshark $(whoami)
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
sudo getcap /usr/bin/dumpcap

echo "wireshark Installation Done"