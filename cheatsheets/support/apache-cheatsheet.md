apache-cheatsheet
===================

A cheatsheet on the usage of apache .

Remember to secure your git directory in the web server, Apache 2.4 in this case. Use apache2.conf for system wide effect. Might as well add some other stuff while you're at it:
```sh
# apache2 stop
sudo service apache2 stop

# apache2 remove from startup
sudo update-rc.d -f  apache2 remove

# apache2 disable/enable during startup
sudo update-rc.d apache2 enable
sudo update-rc.d apache2 disable

# Block all hidden files (.gitignore for example)
<FilesMatch "^\.">
Require all denied
</FilesMatch>

# Block all hidden directories (.git for example)
<DirectoryMatch "^(.*/)*\..*">
Require all denied
</DirectoryMatch>

# Block requests filename~ formatted backup files
<Files ~ "\~$">
Require all denied
</Files>

# Block requests for misc extensions, (?i) is case insensitive
<Files ~ "\.(?i)(inc|bak|orig|old|0|tmp?)$">
Require all denied
</Files>

```
