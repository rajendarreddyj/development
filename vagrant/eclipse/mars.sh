# Set Locale variables for Encoding
sudo echo "LANG=en_US.UTF-8" >> /etc/environment
sudo echo "LANGUAGE=en_US.UTF-8" >> /etc/environment
sudo echo "LC_ALL=en_US.UTF-8" >> /etc/environment
sudo echo "LC_CTYPE=en_US.UTF-8" >> /etc/environment
# Install Java from webupd8team ppa
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y upgrade
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections 
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer
echo "********* Java installed *********"
# Install xfce and virtualbox additions    
sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo apt-get install gnome-icon-theme-full tango-icon-theme
# Permit anyone to start the GUI
sudo echo "allowed_users=anybody" > /etc/X11/Xwrapper.config
# Eclipse Download and Extract
sudo wget -O /opt/eclipse-jee-mars.tar.gz http://ftp.ussg.iu.edu/eclipse/technology/epp/downloads/release/mars/2/eclipse-jee-mars-2-linux-gtk.tar.gz
cd /opt/ && sudo tar -zxvf eclipse-jee-mars.tar.gz
echo "********* Eclipse fetched and extracted *********"
# Remove Eclipse tar after Extracting
sudo rm eclipse-jee-mars.tar.gz
echo "********* Eclipse tar Removed *********"
# Install Subversion
sudo apt-get install -y subversion
echo "********* Subversion installed *********"
# Login with username: vagrant, password: vagrant via the login prompt on the virtualbox GUI.
# To Start xfce Use Below Command
# startxfce4 &