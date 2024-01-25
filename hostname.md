# Hostname

`sudo hostnamectl set-hostname my.host.com`
- Updates the hostname of the machine

`cat /etc/hostname`
- Can modify this file to change the hostname as well.

### You must also modify the /etc/hosts file after a hostname change.
- hostnamectl will not update this file.

