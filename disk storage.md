# Disk storage

### Show the storage size of folders from current directory on down 
`du -hsc *`
- **-h** : human readable
- **-s** : summary
- **-c** : show the total amount of space used within our current working directory

### ncdu : Shows the amount of space used by each folder on the system.
`sudo apt install ncdu`
- This utility will scan all directories the user has access to.
- Can navigate down into folders and see the space used. 
- Can also delete folders and files from here.

### Disk Free
`df -h` 
- Shows the amount of free space on the system. Will show the mounted storage volumes.

### List block devices
`lsblk -f`
- **-f** : Output additional information about file systems, including UUID.
