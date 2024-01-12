# usermod: modify a user account

### Adding a user to a group
`sudo usermod -aG admins dirk`
- *-a* : append the user to the group. Without the **-a** then you would reset the group to only be what is specified.
- *-G* : add the user to the group
- *admins* : group to be added to.
- *dirk* is the user to be added to admins group
- can add to multiple groups by comma separating them. e.g. sudo usermod -aG **admins,users,developers** dirk

### Removing a user from a group
`sudo gpasswd -d dirk admins`
- *-d* : delete user (dirk) from group (admins)

### Changing home directory
`sudo usermod -d /home/dirk2 --move-home dirk`
- *-d* : change home directory
- *--move-home* : move contents of old home directory to new home directory

### Changing the user's name
`sudo usermod -l dirk_new_name dirk_current_name`
- *-l* : change username

### Locking a user account
`sudo usermod -L dirk`
- *-L* : lock user account

### Unlocking a user account
`sudo usermod -U dirk`
- *-U* : unlock user account

### Creating a temporary account
`sudo usermod dirk -e 2024-12-31`
- *-e* : expire user account on a specific date

### Creating a group
`sudo groupadd admins`
- create an admin group

### Showing groups that a member is a part of
`sudo groups dirk`
- Show what groups dirk is a member of
- Using `groups` without a user will show your own user
- If wanting to view another user's groups you must use **sudo**

### Showing user account information
`sudo chage -l dirk`
- *-l* : list user account aging information (password expiry date, etc.)

### Changing a passwod
`passwd <username>`
- Change password for a user
- Must be the user or in su -