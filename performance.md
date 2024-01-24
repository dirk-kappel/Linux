# Performance

### Viewing load average
`cat /proc/loadavg`  : This will show the load average. Represents trend in CPU utilization.
`uptime` : Will also show load average.
`htop` : Load average shown in top right.
Output:
0.00, 0.05, 0.04
- 1 min, 5 min, 15 min
- Each number represents how ay tasks were waiting for CPU attention in the given time.
- If number is equal to number of cores then CPU is 100%.

### htop : interactive process viewer
- **u** : user. Narrow down process by user
- **f3** : search by name
- **Tree** : View that shows processes that have spawned other processes.
