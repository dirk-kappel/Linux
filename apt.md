## apt : package management

### List of repositories
`/etc/apt/sources.list`

### Add a repository.
`sudo add-apt-repository <repo name>`

### List all installed packages
`dpkg --get-selections > packages.list`

### Import a saved package list
`sudo dpkg --set-selections < packages.list`