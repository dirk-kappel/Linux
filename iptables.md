# [IP Tables - Linux tool to create a custom firewall](https://www.frozentux.net/iptables-tutorial/chunkyhtml/)

## TABLES
### Consists of 5 Tables. First three are main.
1. **FILTER** - Default. When you don't mention a specific table then this will default. 
2. **NAT** - Provides network address translation rules. 
3. **MANGLE** - Alter the IP headers of the packet.
4. **RAW** - Connection tracking. Mark packets for ongoing session.
5. **SECURITY** - SELinux tagging. 

## Chains
### Points in the route of a packet where you can apply rules. 
1. **PRE ROUTING** - Applied to any incoming packet. Processed before any routing decision is made.
2. **INPUT** - Applied when packet enters the network stack.
3. **FORWARD** - Applied when packet is routed through the system.
4. **OUTPUT** - Applied to the packet originated from the system and going out.
5. **POST ROUTING** - After routing decision and packet is going on the wire.

### Traversal Order
- Incoming packets destined for the local system: *PRE ROUTING -> INPUT*
- Incoming packets destined to another host: *PRE ROUTING -> FORWARD -> POST ROUTING*
- Locally generated packets: *OUTPUT -> POST ROUTING*

## RULES
### Commands to manipulate network traffic.
- e.g. `iptables -A INPUT -s 15.15.15.51 -j DROP`
- Each rule has two components. **Matching Component**=*[-s 15.15.15.51]* and **Target Component**=*[-j DROP]*
- You can match by protocol type, destination or source address, destination or source port, input or output interface, headers, etc.
- The target component is the action when there is a matching component that is satisfied.
  1. **Terminating Targets** - Ends any further traversal of the packet in the chain.
     - ACCEPT
     - DROP
     - QUEUE
     - RETURN
     - USER-DEFINED
  2. **Non-Terminating Targets** - Perform an action then continue the chain. 


# Command Syntax

## List out iptable rules
`sudo iptables -L -n -v --line-n`
- **-L** : list out the table
- **-n** : numeric format
- **-v** : verbose
- **--line-n** : display the line number for the rules
- Results are given for the default table (FILTER) since no table was specified.

`sudo iptables -t mangle -L -n -v`
- **-t** : will list out a specified table (mangle)

# Output:
[ec2-user@ip-172-31-82-175 ~]$ sudo iptables -L -n -v

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination    

- No rules are setup yet.

## [Syntax](https://www.frozentux.net/iptables-tutorial/chunkyhtml/c1914.html)
`iptables -t [table] -OPTIONS [CHAIN] [Matching Component] [Action Component]`
- **t** : The table name. You can provide any of the five from above. Default is the filter table.
- **-OPTIONS [CHAIN]** : The chain that you want the rule to apply to.
  - A [APPEND] 
  - D [DELETE]
  - I [INSERT]
  - R [REPLACE]
  - Z [ZERO COUNTERS]
  - L [LIST]
  - P [POLICY]
  - E [RENAME]
  - F [FLUSH]
  - N [NEW USER DEFINED CHAIN]
  - D [DELETE CHAIN]
- **[Matching Component]** : Give a condition, if it is true then take action. If not then continue to the next rule.
  1. [Generic conditions:](https://www.frozentux.net/iptables-tutorial/chunkyhtml/c2264.html)
    - p : Protocol
    - s : Source IP
    - d : Dest IP
    - i : INput interface
    - o : OUTput interface
  2. [Implicit:](https://www.frozentux.net/iptables-tutorial/chunkyhtml/x2436.html)
    - TCP:
      -sport
      -dport
    --tcp-flags
  3. [Explicit:](https://www.frozentux.net/iptables-tutorial/chunkyhtml/x2702.html)
    - Match Extensions
    -m : conntrack, dscp, ecn, iprange, etc
- **[Action Component]** : Action to perform if the condition is true.
  - -j : (for jump)
    - ACCEPT : Accept the packet.
    - DROP : Drop the packet.
    - REJECT : Similar to drop but a response is sent back to the source.
    - RETURN : Stop the traverse and return to the previous chain with no effect.

# Examples:

## Block a website:

### Add a rule
`sudo iptables -A INPUT -s example.com -j DROP`

### Remove a rule
`sudo iptables -D INPUT 1`
- 1 is the rule number to remove.

### Change the default policy to drop
`sudo iptables -P INPUT DROP`

### Change the policy back to accept
`sudo iptables -P INPUT ACCEPT`

### Save the iptable output to a file
`sudo iptables-save > /tmp/iptables`
- You can then make edits to the table and then reload it.
`iptables-restore < /tmp/iptables`

### Testing commands
`sudo iptables -A INPUT -p tcp -j ACCEPT`\
`sudo iptables -A INPUT -j ACCEPT -m comment --comment "Allow all incoming traffic"`\
- **-m comment --comment** : This will add a comment to the rule.\
`sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT`\
`sudo iptables -A INPUT -p tcp --dport http -j ACCEPT -m comment --comment "Allow all incoming traffic"`\
- The comment will be appended to the default comment of the rule.\
`sudo iptables -A INPUT -s ip-172-31-82-175.ec2.internal/8 -j DROP`\
`sudo iptables -A INPUT -s 127.0.0.0/8 -j DROP`\
`sudo iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT`\
`sudo iptables -A OUTPUT -p tcp -j ACCEPT`\
`sudo iptables -I INPUT -s 172.58.56.179 -j ACCEPT`\
- **-I** : Will insert this rule at the top.\