# Copying files

## rsync : remote and local file copying tool.

`sudo rsync -av /home/myuser /backup` : copy files from /home/myuser to /backup
- **-a** : archive mode. Uses the flags -rlptgoD
- **-v** : verbose mode

`sudo rsync -av /home/myuser admin@192.168.1.5:/backup`
- Will use ssh to copy files from /home/myuser to the remote machine. The /backup will be in the home directory of admin.

### Synchronize
`sudo rsync -a --delete /src /target`
- This will synchronize two directories. If a file is deleted on /src then it will be deleted on /target. 

### Backup option
`sudo rsync -avb --delete /src /target`
- **-b** : This will rename the file /target if is going to be overwritten.

`sudo rsync -avb --delete --backup-dir=/backup/incremental /src /target`
- **--backup-dir** : This will send any replaced files to the /backup/incremental folder before copying over them.

Example script:
`CURDATE=$(date +%m-%d-%Y)`
`sudo rsync -avb --delete --backup-dir=/backup/incremental/$CURDATE /src /target`
- This will add the replaced file into a directory with the current date.

### scp : OpenSSH secure file copy
- Good for copying a small number of files.

`scp myfile.txt jdoe@192.168.1.50:/home/joe`
- This will copy the local myfile.txt to the home directory on a remote machine.
- /home/joe is not required, it is assumed. But you still must have the trailing colon **:**

`scp jdoe@192.168.1.50:myfile.txt .`
- The reverse here. This will copy the remote myfile.txt from jdoe machine into my current directory.

`scp -r /home/jdoe/downloads/linux_iso jdoe@192.168.1.50:downloads`
- **-r** : recursively transfer folders and their contents.
