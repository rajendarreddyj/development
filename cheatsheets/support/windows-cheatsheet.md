windows-cheatsheet
===================

A cheatsheet on the usage of windows.

# Adding Keys and Values:
### Add a key to the registry on machine [TargetIPaddr] within the registry domain [RegDomain] to location [Key]. If no remote machine is specified, the current machine is assumed.
```sh
C:\>reg add [\\TargetIPaddr\][RegDomain]\[Key]
```
# Export and Import:
### Import and export can only be done from or to the local machine.
# Export all subkeys and values located in the domain [RegDomain] under the location [Key] to the file [FileName]
```sh
C:\>reg export [RegDomain]\[Key] [FileName]
```
# Import all registry entries from the file [FileName]
```sh
C:\>reg import [FileName]
```
# Query for a specific Value of a Key:
### Query a key on machine [TargetIPaddr] within the registry domain [RegDomain] in location [Key] and get the specific value [ValueName] under that key.  Add /s to recurse all values.
```sh
C:\>reg query [\\TargetIPaddr\][RegDomain]\[Key] /v [ValueName]
```

# List all processes currently running:
```sh
C:\>tasklist
```
# List all processes currently running and the DLLs each has loaded:
```sh
C:\>tasklist /m
```
# Lists all processes currently running which have the specified [dll] loaded:
```sh
C:\>tasklist /m [dll]
```
# List all processes currently running and the services hosted in those processes:
```sh
C:\>tasklist /svc
```
# Query brief status of all services:
```sh
C:\>sc query
```
# Query the configuration of a specific service:
```sh
C:\>sc qc [ServiceName]
```
# Shutdown Windows immediately:
```sh
C:\> shutdown /s /t 0
```
### Note: Command may not  power down the hardware.
# Restart Windows immediately:
```sh
C:\> shutdown /r /t 0
```
# Abort shutdown/restart countdown:
```sh
C:\> shutdown /a
```
# Show all TCP and UDP port usage and process ID:
```sh
C:\>netstat –nao
```
# Look for usage of port [port] every [N] seconds:
```sh
C:\>netstat –nao [N] | find [port]
```
# Dump detailed protocol statistics:
```sh
C:\>netstat –s  –p [tcp|udp|ip|icmp]
```
# Search directory structure for a file in a specific directory:
```sh
C:\>dir /b /s [Directory]\[FileName]
```
# Count the number of lines on StandardOuy of [Command]:
### Finds the count (/c) of lines that do not contain (/v) nothing ("").  Lines that do not have nothing are all lines, even blank lines, which contain CR/LF
```sh
C:\>[Command] | find /c /v ""
```
# Local User Manager (includes group management):
```sh
C:\>lusrmgr.msc
```
# Services Control Panel:
```sh
C:\>services.msc
```
# Task Manager:
```sh
C:\>taskmgr.exe
```
# Security Policy Manager:
```sh
C:\>secpol.msc
```
# Event Viewer:
```sh
C:\>eventvwr.msc
```
# Control Panel:
```sh
C:\>control
```
## Close GUI windows by hitting Alt-F4

# Turn off built-in Windows firewall:
```sh
C:\>netsh firewall set opmode disable
```
# Configure interface “Local Area Connection” with [IPaddr] [Netmask] [DefaultGW]:
```sh
C:\>netsh interface ip set address local static [IPaddr] [Netmask] [DefaultGW] 1
```
# Configure DNS server for “Local Area Connection”:
```sh
C:\>netsh interface ip set dns local static [IPaddr]
```
# Configure interface to use DHCP:
```sh
C:\>netsh interface ip set address local dhcp
```
