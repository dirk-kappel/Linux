# Formatting and mounting drives

`lsblk`
- list all block device drives
- sdb is common name to give to a drive.
- available at /dev/sdb

`sudo fdisk -l`
- Information about all the drives on the system.

### Show a list all mounted storage devices on the system.
`mount`
`mount | grep xvda` : To narrow down the list.

### Unmount a drive
`sudo umount /dev/xvdf1`

### Create a partition table
`sudo fdisk /dev/xvdf`
- p : print the partition table
- m: help
- g: create a new empty GPT partition table (recommended)
- n: add a new partition
- w: write -- this will make the changes final.
- The disk is still unformatted.

### Format the disk
- ext4 is the most common file system for linux.
- flash drive exfat (for windows or Macs)
- Multiple operating systems use exfat. Must install first (see below)
- debian: `sudo apt install exfat-utils exfat-fuse`
- fedora: `sudo dnf install exfat-utils fuse-exfat` : probably need to add the rpmfusion or epel repo first.
`sudo mkfs.ext4 /dev/xvdf1`
- **-n** : name the drive

### Mounting is essentially attaching storage volume to a folder. Suggested at /mnt or /media
- /media is used for removable media, e.g. flash drives.
- /mnt is used for permanent storage, e.g. hard drives.
`sudo mount /dev/xvdf1 /mnt/drive1/`

### Disk Free
`df -h` 
- Shows the amount of free space on the system. Will show the mounted storage volumes.


