# apt : package management
- Repository is an online server that contains one or more packages. Similar to an app store.
- Packages are applications.

### List of repositories
`/etc/apt/sources.list`

### Add a repository.
`sudo add-apt-repository <repo name>`

### List all installed packages
`dpkg --get-selections > packages.list`

### Import a saved package list
`sudo dpkg --set-selections < packages.list`

### Updates the package index, not the packages.
`sudo apt update`

### Searches for a package (firefox).
`apt search <firefox>`

### Installs a package (vim-nox).
`sudo apt install vim-nox`

### Removes a package (vim-nox).
`sudo apt remove vim-nox`

### Upgrading installed packages
`sudo apt upgrade`
- This will actually upgrade the packages.
- Update any packages that don't require anything to be removed or added.

`sudo apt dist-upgrade`
- Packages may be added or removed. Will show up from upgrade under newly installed or to remove.
- Run after upgrade.

### List packages with apt
`apt list`
`apt show wget` : shows details of the wget package

### rpm
`rpm -qd wget` : shows the location of the docs and the manual page for the package.
