# ssh : OpenSSH remote login client

### Generate a key pair
`ssh-keygen -b 4096`

`ssh-keygen -p /path/to/key`
- **-p** : Changes the passphrase of the key. With no arguments it will assume the default key.

### Copy the public key to the remote host
`ssh-copy-id -i ~/.ssh/rsa_2.pub ec2-user@18.234.68.160`
- **-i** : identity file 

## Protecting ssh. 
1. Stop ssh. If you are not using it then turn it off. Not practical for most cases.
sudo systemctl stop sshd
sudo systemctl disable sshd

2. Change the port. Offers some value but will not stop attacks. Any port scan will turn up port in use. Will stop automated attacks.
`sudo vim /etc/ssh/sshd_config`
- Change the port number to something else.
- Port 22: Uncomment and change it to something else. You should backup the config file first before making any changes.
`sudo systemctl restart sshd` : need to restart service after the config file is changed.

3. Disable root login. If you need to use root then you can login as a normal user and then su to root.
sudo vim /etc/ssh/sshd_config
- **PermitRootLogin yes** : Uncomment and change to no.
- **prohibit-password** : cannot log in with a password. Only with a key.
- Need to have a user account with sudo privileges set up that can log in before making this change.
`sudo systemctl restart sshd`

4. Disable password authentication. You can not log in with a password prompt, only a key.
- **PasswordAuthentication yes** : Uncomment and change to no.
- Need an ssh key installed on the remote host before making this change.
- Save key at **~/.ssh/authorized_keys**
`sudo systemctl restart sshd`

5. Use a firewall.
- firewalld
- iptables
- Good to set up in the cloud, for example security groups in AWS.

6. Use a hardware key. Yubikey is an example.
- USB device with a button that you insert into your computer. When you press the button it will generate a key and send it to the remote host.


### SSH Agent : Allows you to store unlocked key in memory
`eval $(ssh-agent)`
- This will start the ssh agent process in the background
`ssh-add ~/.ssh/id_rsa`
- This will add the key to the agent. You will be asked for the passphrase.

### Show if ssh is listening
`sudo ss -tunlp | grep ssh`
