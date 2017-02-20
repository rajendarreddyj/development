# udev-rules
## Introduction
This repository contains udev rules for android/u2f security key and docker which i frequently use.

## what is udev ?
From [Wikipedia article](https://en.wikipedia.org/wiki/Udev):

udev is a device manager for the Linux kernel. As the successor of devfsd and hotplug, udev primarily manages device nodes in the /dev directory. At the same time, udev also handles all user space events raised while hardware devices are added into the system or removed from it, including firmware loading as required by certain devices.

From [ArchLinux Wiki](https://wiki.archlinux.org/index.php/Udev):

Udev rules written by the administrator go in /etc/udev/rules.d/, their file name has to end with .rules.

The udev rules shipped with various linux distributions are found in /usr/lib/udev/rules.d/.

If there are two files by the same name under /usr/lib and /etc, the ones in /etc take precedence.

## Installation

#### U2F FIDO rules
For U2F Security key to work in linux systems.
Log in as root and create this file:

/etc/udev/rules.d/45-u2f.rules

Now execute:

chmod a+r /etc/udev/rules.d/45-u2f.rules

Try group plugdev rather than plugindev.

Then restart udev:

sudo udevadm control --reload-rules

sudo service udev restart

#### docker rules
Add udev rules files for hiding the docker loopback devices from udisks. These docker udev rules prevents them from showing up on the desktop in a window manager, for example. If you use docker in a graphical environment, when you start a container - the mounted filesystem will be shown in Gnome Files explorer.

To avoid this Log in as root and create this file:

/etc/udev/rules.d/80-docker.rules

Now execute:

chmod a+r /etc/udev/rules.d/80-docker.rules

Then restart udev:

sudo udevadm control --reload-rules

sudo service udev restart

#### Android rules

For Android rules refer to http://developer.android.com/guide/developing/device.html and included many suggestions from the Archlinux and Github Community.

If you're developing on Ubuntu Linux, you need to add a udev rules file that contains a USB configuration for each type of device you want to use for development.

In the rules file, each device manufacturer is identified by a unique vendor ID, as specified by the ATTR{idVendor} property.

For a list of vendor IDs, see USB Vendor IDs, below.

To set up device detection on Ubuntu Linux:

Log in as root and create this file:

/etc/udev/rules.d/51-android.rules

Use this format to add each vendor to the file:

SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", MODE="0666", GROUP="plugdev"

In this example, the vendor ID is for HTC.

The MODE assignment specifies read/write permissions, and GROUP defines which Unix group owns the device node.

Note: The rule syntax may vary slightly depending on your environment. Consult the udev documentation for your system as needed. For an overview of rule syntax, see this guide to writing udev rules.

please refer to 51-android.rules in [current directory](./51-android.rules)

Now execute:

chmod a+r /etc/udev/rules.d/51-android.rules

Try group plugdev rather than plugindev.

Then restart udev:

sudo udevadm control --reload-rules

sudo service udev restart


###### Note: For ubuntu distribution, add plugdev group to ubuntuloginid.

Add plugdev to ubuntuloginid

sudo useradd -G plugdev ubuntuloginid
