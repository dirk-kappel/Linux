# chage : change user password expiry information

### Temporary accounts
`sudo chage -E 2025-01-22 dirk`
- -E : specify expiry date for user account

### Show user account information
`sudo chage -l neo`
- -l : list user account aging information (password expiry date, etc.)

### Showing user account information
`sudo chage -l dirk`
- **-l** : list user account aging information (password expiry date, etc.)


### Set maximum password age
`sudo chage -M 90 neo`
- -M : specify maximum number of days between password change
- set to -1 for never expire

### Set minimum password age
`sudo chage -m 7 neo`
- -m : specify minimum number of days between password change

### Lock an account
`sudo passwd -l`
- -l : lock user account

### Unlock an account
`sudo passwd -u`
- -u : unlock user account
