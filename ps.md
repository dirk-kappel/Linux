# ps : report a snapshot of the current processes
- PID = Process ID. Unique number for each process.
- TTY = Terminal the process is running on.
- TIME = Time (CPU time) the process has been running.
- CMD = Command

`ps x`
- STAT:
  - S = uninterruptible sleep
  - R = actively running
  - T = stopped
  - s = process leader or root process that started other process

`ps -He`
- **-H** : show process hierarchy
- **-e** : show all processes regardless of the terminal

### Better way to show process hierarchy(relationships)
`ps -axjf`
- PPID : Parent Process ID
- PGID : Process Group ID
- SID : Session ID
- TPGID : Terminal Process Group ID
- UID : User ID [0 = root, 1000 = first user, 1001 = second user, etc.]

### User/CPU/more processes
`ps aux`
- shows cpu, memory, start time, etc.
- **u** : user oriented format
- **x** : no longer limiting our processes within a TTY

### Process list filter
`ps us -C nginx`
- Will filter and show nginx processes
or
`ps aux | grep nginx`

### Sort processes based on highest cpu usage
`ps aux --sort=-pcpu`
`ps aux --sort=-pcpu | head -n 5`
- Return top 5

### Sort processes based on highest memory usage
`ps aux --sort=-pmem`

### Show priority and niceness of processes
`ps -l`

### Modify the niceness of a process
`renice -n 10 -p 1789`
- **-n** : New nice value. To move down you must use sudo. The -n option is not required as it is implied.
- **-p** : PID to renice. The -p option is not required as it is implied.
 
 ### Start a process with a nice value set
 `nice -n 10 vim`
 `nice --10 vim`
- This will drop the nice value to a negative value. The n is omitted.