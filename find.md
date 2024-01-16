# find : search for files in a directory hierarchy

### Find any files in my home directory that is a txt extension.
`find /home/wsl2 -name *.txt`

### Quote the name to search recursively.
`find /home/wsl2 -name '*.txt'`

### Exclude the .local directory.
`find /home/wsl2 -name '*.txt' | grep -v .local`

### Find all files named Documents in the current directory.
`find . -name Documents -type f`
- **-type** : -d for directory, -f for file.

### Find all files named Documents in the current directory and delete them.
`find . -type f -name Documents -exec rm {} +`
- **-exec** : execute a command on the results.
- **rm** is the command
- **{}** is the placeholder for the results
- **+** is the end of the command, \; is another way of ending the command. You need to terminate the find command anytime you are using the find command.

## Example:
### Find all files in the Pictures directory and change the permissions to 600.
`find Pictures/ -type f -exec chmod 600 {} +`

### Find all files in the /var/log directory that ends with .log and truncate them to 0 bytes.
`sudo find /var/log -type f -name '*.log' -exec truncate -s 0 {} +`
