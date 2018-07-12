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

# Linux grep / find
```sh 
grep -rF "string" * --color
grep -R -H "string" .
grep -H -R "string" . | cut -d: -f1 # display just filenames
 
find . | xargs grep 'string' -sl
find . -iname '*php' | xargs grep 'string' -sl
``` 
# find by filename
```sh 
find path/to/file/ -name "file.php" -print
```  
# Run Task
```sh 
sudo -uapache php InstallTask.php 6.8/TaskName.php
```  
# Forward ports
```sh 
ssh -R 2222:localhost:22 office.polldev.com
```  
# To know which ports are currently used
```sh 
netstat -a -v
``` 
# generate ssh keys
```sh 
ssh-keygen -t rsa -C "test@gmail.com"
``` 
# Copy file to remote server
```sh 
scp ~/.ssh/id_rsa.pub root@192.168.1.250:/root/.ssh/eugene.pub 
cat id_dsa.pub >> authorized_keys
``` 
# truncate (empty) a file in bash
```sh 
>| filename
``` 
# disk usage
```sh 
df
df -i
``` 
# per directory
```sh
cd /
sudo du -sh ~/*
``` 
# clear used space
```sh 
cd /var/spool/mqueue/
find . | xargs rm -f
``` 
# keyboard repeat rate (man kbdrate)
# -r is the number of characters per second and -d specifies the delay in milliseconds
```sh 
kbdrate -r 4.3 -d 500
``` 
# Network settings for CentOS VM
```sh 
vim /etc/sysconfig/network-scripts/ifcfg-eth0
vim /etc/sysconfig/network
rm -f /etc/udev/rules.d/70-persistent-net.rules
/etc/init.d/network restart
```
# turn a find or cut (cut delimiter, get first column) output into a list
```sh
/etc find . -name "*bash*" | xargs
cut -d, -f1 file.csv | xargs
``` 
# find a file and grep for a word in the file
```sh
find . -name "*.java" | xargs grep "Stock"
``` 
# handeling filenames which have WHITESPACE
```sh
ls *txt | xargs  -d '\n' grep "cost"
``` 
# find file and remove it, command is different if there is white space present in filename
```sh
find . -name "*m1.java" | xarg rm
find /tmp -name "*m 1.java" -print0 | xargs -0 rm
``` 
# count lines of all text files in the cwd
```sh
ls -1 *.txt | xargs wc -l
``` 
# rename files to append .old on the end of the filename (-I allows {} to represents each file outputed from ls command)
```sh
ls *old | xargs -I {} mv {} {}.old
``` 
# find fastQ files in sub dirs, sort and pair them (helpful for pairing pair-end fastqs on the same line, which can be piped into trim_galore etc.)
```sh
find ~/fastq/*/* -name '*.fastq.gz' | sort | xargs -n2
```
# find all files ending in txt in current dir and sb-dirs
```sh
find . -name "*.txt"
find . -iname "*.txt" # ignore case
``` 
# find files that don't end in txt
```sh
find . -name -not "*.txt"
``` 
# find txt files between sub-directory level 2 and 4
```sh
find /home/ -mindepth 3 -maxdepth 5 -name "*.txt"
``` 
# find files in cwd with executable permissions
```sh
find . -perm -g=x "*.txt"
``` 
# find empty files in current dir
```sh
find . -maxdepth 1 -empty
``` 
# find directories and files respectively for query
```sh
find . -type d "project"
find . -type f "*.py"
``` 
# get files larger, smaller or equal to 1GB
```sh
find . -size +1G
find . -size -1G
find . -size 1G
``` 
# get files modified in the last 60 minutes and last day
```sh
find . -mmin -60
find . -mtime -1
``` 
# get files accessed in the past 60 minutes and last day
```sh
find . -amin -60
find . -atime -1
``` 
# get files that changed (written) in the past hour or day
```sh
find . -cmin -60
find . -ctime 1
``` 
# find conf files and copy into temp dir
```sh
find . -name "*.txt" -exec cp {} temp/ \;
find . -name "*.txt" | xargs -I {} cp {} temp/v
```
# find something in first line, outputs filepath and file 
```sh
find . -type f -exec sh -c "if head -n 1 {} | grep 'firrst row text' > /dev/null; then echo {}; cat {}; fi; " \;
```
# looping over array 
```sh
for i in "${arrayName[@]}"; do
   # do whatever on $i
done
``` 
# Switch-case
```sh
case ${ENV} in
  "development") 
    ;;
  "staging")
    ;;
  "production")
    ;;
  *)
    ;;
esac
``` 
# ENV validation
```sh
case ${ENV} in
   "development") ;;
   "staging") ;;
   "production") ;;
   *)
      echo "ENV should be one of: [development staging production]"
      exit 1
      ;;
esac
```
# bash execution
## Run A and then B, regardless of success of A
```sh
A; B
```
## Run B if A succeeded
```sh
A && B
```
## Run B if A failed
```sh
A || B
```
## Run A in background.
```sh
A &     
```
# No of files open per process
```sh
ps aux | sed 1d | awk '{print "fd_count=$(lsof -p " $2 " | wc -l) && echo " $2 " $fd_count"}' | xargs -I {} bash -c {}
```
