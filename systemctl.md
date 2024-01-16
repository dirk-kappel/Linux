# systemctl :  Control the systemd system and service manager

### Output all services running or not in the background
`systemctl`

### Show status of a service
`systemctl status httpd`

### enable a service to start at boot
`sudo systemctl enable httpd`

### disable a service from starting at boot
`sudo systemctl disable httpd`

### start a service
`sudo systemctl start httpd`

### stop a service
`sudo systemctl stop httpd`

### enable and start a service
`sudo systemctl enable --now httpd`

### status of a service instance for my-user
`systemctl status httpd@my-user`

### location of service files
`/usr/lib/systemd/system`

### More graceful way to check the status of all services.
`systemctl list-unit-files --type=service`

### restart a service
`sudo systemctl restart httpd`

### reload a service. Does a reload but the service does not go down. New settings will take place if no restart is required.
`sudo systemctl reload httpd`

