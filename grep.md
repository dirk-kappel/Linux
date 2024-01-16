# grep : search for patterns in a file

`cat /etc/ssh/ssh_config | grep -v Port`
- **-v** : Show everything except Port

### You don't need the cat command, grep can read files directly.
`grep Port /etc/ssh/ssh_config`
- This will show every line with 'Port' in it.

`grep -i port /etc/ssh/ssh_config`
- **-i** : Ignore case

`grep -n Port /etc/ssh/ssh_config`
- **-n** : Show line numbers

`grep -c Port /etc/ssh/ssh_config`
- **-c** : Show the number of lines that match

`grep -r Port /etc/ssh/`
- **-r** : Recursively search all files in a directory