# ClamAV : https://docs.clamav.net/Introduction.html

### Install ClamAV
`apt install clamav` : include clamtk for a UI.

### Scanning tool for cli is clamscan
`clamscan -r --log=<location of log files> --move=<quarantine directory> <location to scan>`
- **-r** : recursive
- **-i** : limit the output to only infected files

### Schedule scan
- Uses cron


### Update virus databases
`sudo freshclam`
- Manually. Also can set up with a cron job.

### Use the update service
`sudo systemctl start clamav-freshclam.service`
`sudo systemctl enable clamav-freshclam.service`

### Taking action on infected files
Three options
1. Move the file
  - `clamscan -r --move=/path/to/move /directory/to/scan`
2. Copy the file
  - `clamscan -r --copy=/path/to/quarantine /directory/to/scan`
3. Remove the file
  - `clamscan -r --remove=yes /path/to/scan`

### Auto Scanning
`/etc/clam.d/scan.conf`
- Set `OnAccessPrevention yes`
- Set `OnAccessExcludeUname` to clamd's uname (clamav)
- Set `OnAccessIncludePath` to the directories to be scanned
- Set `OnAccessExcludePath` to exclude directories to be scanned
- Set `OnAccessMaxFileSize` to the maximum size of file to scan
`clamd` : to start the clam daemon
`sudo clamonacc` : To start on access
etc.,etc. (more to do)

## Installing ClamAV

### Create a Service account
- `groupadd clamav`
- `useradd -g clamav -s /bin/false -c "Clam Antivirus" clamav`
- `sudo chown -R clamav:clamav /usr/local/share/clamav`

### Generate example configs, if needed:
`clamconf -g freshclam.conf > freshclam.conf`
`clamconf -g clamd.conf > clamd.conf`
`clamconf -g clamav-milter.conf > clamav-milter.conf`

### Quick test, run freshclam
- If all is ok then create log files:
`touch /var/log/freshclam.log`
`chmod 600 /var/log/freshclam.log`
`chown clamav /var/log/freshclam.log`

### To run freshclam in daemon mode:
`freshclam -d`
- Or set up a cron job
`N * * * *   /usr/local/bin/freshclam --quiet`

