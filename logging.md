# Logging

## Location
/var/log

# Log files in /var/log/

### boot.log : On Fedora systems
- Messages during the boot process

### dnf.log : On Fedora
- History of packages recently installed

### wtmp
- Binary log.
- To view use : `last`
- Shows user log in.

### btmp
- Binary log.
- To view use : `lastb -adF`
- **-a** : Show the hostname in last
- **-d** : Attempt to match DNS
- **-F** : Show full times

### auth.log : Ubuntu
- Log in attempts

### syslog : Ubuntu
- Log of system events

### apt : Directory for installed packages
- history.log

### dmesg
- Similar information to syslog but shows in a different format.
- More information when troubleshooting hardware.
`dmesg` : Command to view the logs from dmesg.

### journalctl : Specific to systemd
- systemd : init system.
- Inspect units or services and view the logs specific to those units.
`journalctl -u ssh`
- **-u** : unit
- **-f** : follow a unit. Similar to tailing a file. e.g. `journalctl -fu ssh`
