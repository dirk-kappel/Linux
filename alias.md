# Alias

### Create an alias
`alias my_alias="ls -lh"`

### List all aliases
`alias`

### Remove an alias
`unalias my_alias`

## Helpful aliases
`alias df="df -h -x squashfs -x tmpfs -x devtmpfs"`

`alias lsmount="mount | column -t"`

### my external ip
`alias extip="curl icanhazip.com"`

### install alias
`alias i="sudo apt install"`

### speedtest alias
`alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"`

### top 5 memory consuming process
`alias mem5="ps auxf | sort -nr -k 4 | head -5"`

### top 5 cpu consuming process
`alias cpu5="ps auxf | sort -nr -k 3 | head -5"`