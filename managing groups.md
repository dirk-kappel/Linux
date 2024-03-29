# Managing Groups
- Every file is owned by a user and a group.

### Find what groups a user is a member of.
`groups`
`groups <username>` : Find what groups a user is a member of.

### Show all groups by accessing the /etc/group file.
`cat /etc/group`
- wsl2:x:1000:
- wls2: is the group name
- x: is the group password. Not used anymore since it is a security risk.
- 1000: is the group ID (GID)
- : is marking the begining of a column but it is empty. Shows you what users are in the group.

### Add a user to a group
`sudo groupadd gamers`

### Delete a group
`sudo groupdel gamers`

### Primary groups and secondary groups. This is shown in the /etc/passwd file and the /etc/group file.
- Every user has a primary group. When a user creates a file, the file is owned by the user and the user's primary group.

### Add a user to a group
`sudo usermod -a -G gamers <username>`
- **-a** : append
- **-G** : group
`sudo usermod -aG gamers dirk`
- User would need to log out and log back in for the changes to take effect.

### Change the primary group of a user. Not really recommened to do this. There are other things that would need to be changed.
`sudo usermod -g <groupname> <username>`
`sudo usermod -g gamers dirk`

### Can also use gpasswd to add a user to a group.
`sudo gpasswd -a <username> <groupname>`
`sudo gpasswd -a dirk gamers`

### Remove a user from a group
`sudo gpasswd -d <username> <groupname>`
`sudo gpasswd -d dirk gamers`

