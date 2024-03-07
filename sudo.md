# sudo : execute a command as another user

### Information regarding sudo users
`sudo cat /etc/sudoers`
- sudo group can be either sudo or wheel
- Look for members that can run any command (access to ALL)

`sudo -l`
- Let's you know what I can do with sudo

### Run the last command with sudo
`sudo !!`

`/etc/sudoers file` : shouldn't be edited directly.
- ALL=(ALL:ALL) ALL
- First ALL refers to the host or server you are allowed to execute the host on.
- (ALL:ALL) or (ALL) refers to the user you are allowed to execute the command as.
- (user:group) can impersonate the user or group.
- Last ALL refers to the commands you are allowed to execute.

### Make changes to the sudoer file.
`sudo visudo`
- Opens in nano or vi editor.
- Changes are checked for syntax errors before saving.

*dirk    ALL=(ALL:ALL)   NOPASSWD: /usr/bin/yum,/usr/bin/rm*
- dirk can run yum and rm without a password.

`sudo su - dirk`
- Switch User to dirk
