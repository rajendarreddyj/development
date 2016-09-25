#!/bin/bash

echo "Updating packages"
# Update 
sudo apt update && sudo apt -y upgrade

echo "Installing git"
# Install git (https://git-scm.com/)
sudo apt install -y git
echo "git Installation Done"

echo "Installing git-cola gui"
# Install git-cola (https://git-cola.github.io/)
sudo apt install -y git-cola
echo "git-cola Installation Done"

echo "Installing subversion"
# Install subversion (https://subversion.apache.org/)
sudo apt install -y subversion
echo "subversion Installation Done"

echo "Installing gparted"
# Install gparted (http://gparted.org/)
sudo apt install -y gparted
echo "gparted Installation Done"

echo "Installing clamav/clamtk"
# Install gparted (http://www.clamav.net/)
sudo apt install -y clamav clamtk
sudo freshclam
echo "clamav/clamtk Installation Done"

echo "Installing chromium"
# Install Chromium Browser (http://www.chromium.org/)
sudo apt install -y chromium-browser
echo "chromium Installation Done"

echo "Installing ssh"
# Install SSH Server (http://www.openssh.com/)
sudo apt install -y ssh

echo "restarting ssh"
# Start SSH Service
sudo systemctl restart ssh

echo "enabling ssh to restart on boot"
# To automatically start your SSH server after reboot run
sudo systemctl enable ssh
echo "ssh Installation Done"

echo "Installing putty"
# Install putty (http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)
sudo apt install -y putty
echo "putty Installation Done"

echo "Installing geany"
# Install geany (https://www.geany.org/)
sudo apt install -y geany
echo "geany Installation Done"

echo "Installing gimp"
# Install gimp (https://www.gimp.org/)
sudo apt install -y gimp
echo "gimp Installation Done"

echo "Installing vlc"
# Install vlc player (http://www.videolan.org/)
sudo apt install -y vlc
echo "vlc Installation Done"

echo "Installing unison"
# Install unison - file sync tool (https://www.cis.upenn.edu/~bcpierce/unison/)
sudo apt install -y unison
echo "unison Installation Done"

echo "Installing synaptic"
# Install synaptic
sudo apt install -y synaptic
echo "synaptic Installation Done"

echo "Installing Archive Applications"
# Install Archive Applications
sudo apt install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller
echo "Archive Applications Installation Done"

echo "Installing Chat Application"
# Install Chat Application (http://www.skype.com/)
sudo apt install -y skype
echo "Chat Application Installation Done"

echo "Installing Torrent Software"
# Install Torrent Software (http://deluge-torrent.org)
sudo apt install -y deluge
echo "Torrent Software Installation Done"

echo "Installing shutter"
# Install shutter(http://shutter-project.org/)
sudo apt install -y shutter
echo "shutter Installation Done"

echo "Installing bleachbit Software"
# Install bleachbit (http://www.bleachbit.org/)
sudo apt install -y bleachbit
echo "bleachbit Installation Done"

echo "Installing Thunderbird"
# Install Thunderbird (https://www.mozilla.org/en-US/thunderbird/)
sudo apt install -y thunderbird
echo "Thunderbird Installation Done"

echo "Installing Telugu fonts"
# Install Telugu fonts
sudo apt install -y fonts-telu-extra fonts-telu fonts-lohit-telu
echo "Telugu fonts Installation Done"

echo "Cleaning unneccessary packages"
sudo apt -y autoremove 
sudo apt -y autoclean 
sudo apt -y clean
echo "Unneccessary packages Done"