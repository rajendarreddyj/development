linux-cheatsheet
===================

A cheatsheet on the usage of linux.

## Check Bios Version
```sh
# To get Bios Version
sudo dmidecode -s bios-version
# To get CPU ID
sudo dmidecode -t 4 | grep ID
# To get serial number
sudo dmidecode | grep Serial
# To get CPU information
sudo dmidecode -t 4
# To get BIOS Information
sudo dmidecode -t 0
# To get Motherboard information
sudo dmidecode -t 2
# To get OEM
sudo dmidecode -t 11
```
### Compress/Uncompress
```sh
# To compress:
tar cf - <space_separated_list_of_files/folders> | gzip -c - > <path>/<archive_name>.tar.gz
# To uncompress:
# cd to the directory you want the files extracted in and run:
gunzip -c <path>/<archive_name>.tar.gz | tar xf -
```

### hostname
```sh
# show or set the system’s host name
hostname
# show or set the system’s NIS/YP domain name
domainname
# show the system’s DNS domain name
dnsdomainname
# show or set system’s NIS/YP domain name
nisdomainname
# show or set the system’s NIS/YP domain name
ypdomainname
```