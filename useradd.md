# useradd : create a new user or update default new user information

### create a a new user called dirk
`sudo useradd dirk`

### set a password for dirk
`sudo passwd dirk`

`sudo useradd -m -d /opt/dirk2 dirk2`
- **-m** : create home directory for user
- **-d** : specify home directory for user

`sudo useradd -g mygroup dirk3`
- **-g** : specify primary group for user

`sudo useradd -g users -G wheel,docker john`
- **-G** : specify secondary groups for user
- john is a member of users, wheel and docker groups

`sudo useradd -s /usr/bin/zsh john`
- **-s** : specify login shell for user

`sudo useradd -c "Test User Account" john`
- **-c** : specify comment for user

`sudo useradd -e 2025-01-22 john`
- **-e** : specify expiry date for user account
- temporary user account

`useradd -D`
- **-D** : display default useradd configuration

`sudo userdel dirk`
- delete user dirk

`sudo useradd -r sysuser`
- **-r** : create system user account

### /etc/passwd
1. username
2. password. x means the password is hashed and stored in /etc/shadow.
3. user ID (UID)
4. group ID (GID)
5. user ID info. This is the comment field. gecos is the old name for this field. Change with chfn or usermod -c.
6. home directory
7. login shell
- /usr/sbin/nologin is used for system accounts that are not meant to be logged into.

### /etc/shadow
1. username
2. password
3. last password change
4. minimum password age
5. maximum password age
6. password warning period
7. password inactivity period
8. account expiration date
9. reserved field
- The password field is encrypted with a salted hash. The password is stored in /etc/shadow instead of /etc/passwd for security reasons.  