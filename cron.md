# cron

### Every user has a list of cron jobs called their crontab. 
`crontab -l`
- show the list of cron jobs for the current user

`crontab -e`
- edit the list of cron jobs for the current user

### Cronjobs consists of 6 fields:
`* * * * * command`
1. minute (0-59)
2. hour (0-23)
3. day of month (1-31)
4. month (1-12)
5. day of week (0-6, 0=Sunday)
6. command to execute

## Example:
### Run the command echo "Hello World" every minute
`* * * * * echo "Hello World" >> /tmp/cron.log`

### Run the command echo "Hello World" every hour
`@hourly echo "Hello World" >> /tmp/cron.log`

### Run the command echo "Hello World" every time the server reboots
`@reboot echo "Hello World" >> /tmp/cron.log`

### Edit the crontab for the user john
`sudo crontab -u john -e`