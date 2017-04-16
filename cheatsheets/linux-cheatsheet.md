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
 
grep -rF "string" * --color
grep -R -H "string" .
grep -H -R "string" . | cut -d: -f1 # display just filenames
 
find . | xargs grep 'string' -sl
find . -iname '*php' | xargs grep 'string' -sl
 
# find by filename
 
find path/to/file/ -name "file.php" -print
 
# Run Task
 
sudo -uapache php InstallTask.php 6.8/TaskName.php
 
# Forward ports
 
ssh -R 2222:localhost:22 office.polldev.com
 
# To know which ports are currently used
 
netstat -a -v
 
# generate ssh keys
 
ssh-keygen -t rsa -C "lyushenko@gmail.com"
 
# Copy file to remote server
 
scp ~/.ssh/id_rsa.pub root@192.168.1.250:/root/.ssh/eugene.pub 
cat id_dsa.pub >> authorized_keys
 
# truncate (empty) a file in bash
 
>| filename
 
# disk usage
 
df
df -i
 
# per directory
cd /
sudo du -sh ~/*
 
# clear used space
 
cd /var/spool/mqueue/
find . | xargs rm -f
 
# keyboard repeat rate (man kbdrate)
# -r is the number of characters per second and -d specifies the delay in milliseconds
 
kbdrate -r 4.3 -d 500
 
# Network settings for CentOS VM
 
vim /etc/sysconfig/network-scripts/ifcfg-eth0
vim /etc/sysconfig/network
rm -f /etc/udev/rules.d/70-persistent-net.rules
/etc/init.d/network restart

# turn a find or cut (cut delimiter, get first column) output into a list
/etc find . -name "*bash*" | xargs
cut -d, -f1 file.csv | xargs
 
# find a file and grep for a word in the file
find . -name "*.java" | xargs grep "Stock"
 
# handeling filenames which have WHITESPACE
ls *txt | xargs  -d '\n' grep "cost"
 
# find file and remove it, command is different if there is white space present in filename
find . -name "*m1.java" | xarg rm
find /tmp -name "*m 1.java" -print0 | xargs -0 rm
 
# count lines of all text files in the cwd
ls -1 *.txt | xargs wc -l
 
# rename files to append .old on the end of the filename (-I allows {} to represents each file outputed from ls command)
ls *old | xargs -I {} mv {} {}.old
 
# find fastQ files in sub dirs, sort and pair them (helpful for pairing pair-end fastqs on the same line, which can be piped into trim_galore etc.)
find ~/fastq/*/* -name '*.fastq.gz' | sort | xargs -n2

# find all files ending in txt in current dir and sb-dirs 
find . -name "*.txt"
find . -iname "*.txt" # ignore case
 
# find files that don't end in txt
find . -name -not "*.txt"
 
# find txt files between sub-directory level 2 and 4
find /home/ -mindepth 3 -maxdepth 5 -name "*.txt"
 
# find files in cwd with executable permissions
find . -perm -g=x "*.txt"
 
# find empty files in current dir
find . -maxdepth 1 -empty
 
# find directories and files respectively for query
find . -type d "project"
find . -type f "*.py"
 
# get files larger, smaller or equal to 1GB
find . -size +1G
find . -size -1G
find . -size 1G
 
# get files modified in the last 60 minutes and last day
find . -mmin -60
find . -mtime -1
 
# get files accessed in the past 60 minutes and last day
find . -amin -60
find . -atime -1
 
# get files that changed (written) in the past hour or day
find . -cmin -60
find . -ctime 1
 
# find conf files and copy into temp dir
find . -name "*.txt" -exec cp {} temp/ \;
find . -name "*.txt" | xargs -I {} cp {} temp/v

# find something in first line, outputs filepath and file 
find . -type f -exec sh -c "if head -n 1 {} | grep 'firrst row text' > /dev/null; then echo {}; cat {}; fi; " \;

# looping over array 
for i in "${arrayName[@]}"; do
   # do whatever on $i
done
 
# Switch-case
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
 
# ENV validation
case ${ENV} in
   "development") ;;
   "staging") ;;
   "production") ;;
   *)
      echo "ENV should be one of: [development staging production]"
      exit 1
      ;;
esac

# bash execution
A; B    Run A and then B, regardless of success of A
A && B  Run B if A succeeded
A || B  Run B if A failed
A &     Run A in background.