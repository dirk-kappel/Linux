# cloud-init

### See if package is installed
Fedora: `rpm -qa | grep cloud-init`  
Debian: `dpkg --get-selections | grep cloud-init`

### Config cloud-init
Configuration files located at /etc/cloud
- cloud.cfg : Configuration file

### Reset cloud-init
`cloud-init clean`
`cloud-init init`
