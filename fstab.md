# fstab : static information about the filesystems

- Storage Volumes can be automatically mounted on startup.

### List block devices
`lsblk` 

### Make sure the drive is mounted first:
`mount | grep xvdf` : list mounted devices

### `/etc/fstab` : file that contains information about all the storage volumes that should be mounted on startup.
`sudo nano /etc/fstab`
- include in file: /dev/xvdf1 /mnt/drive1 ext4 defaults 0 3
- defaults are the default options for the file system. It includes rw,suid,dev,exec,auto,nouser,async. 
- 0 0 are the dump and fsck options. Not really used anymore. Usually set to zero.
- 3 Order of file integrity check. 0 means it will not be checked. 1 means it will be checked first. 2 means it will be checked after the root file system.
- Should use a UUID instead of /dev/xvdf1. UUID will never change. See below.

### To mount all the volumes in /etc/fstab
`sudo mount -a` : This will give any errors if there are any.

- UUID : Universally Unique Identifier. Used to identify a storage volume. It is a 128 bit number. It is unique to each storage volume. It is assigned when the volume is formatted. It is used in /etc/fstab instead of the device name.

### find the UUID of a storage volume.
`sudo blkid`

### To update the fstab with a UUID
- First unmount the drive
`sudo umount /dev/xvdf1`
- New /etc/fstab file. UUID will not change.
UUID=9c5cfcfc-b317-4de1-8f2c-ea9920c03188 /mnt/drive1 ext4 defaults 0 3

### Can add the noauto option to /etc/fstab to prevent the drive from being mounted on startup. auto is included in the defaults option but noauto will override it.
- Use if you don't want it mounted on startup but want to mount it manually. e.g. a backup server.
- ro : read only : use when the content of the drive should not be changed.