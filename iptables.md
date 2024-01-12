# IP Tables

## TALBES
### Consists of 5 Tables. First three are main.
1. **FILTER** - Default. When you don't mention a specific table then this will default. 
2. **NAT** - Provides network address translation rules. 
3. **MANGLE** - Alter the IP headers of the packet.
4. **RAW** - Connection tracking. Mark packets for ongoing session.
5. **SECURITY** - SELinux taging. 

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
### Commands to manipulate network track.
- e.g. `iptables -A INPUT -s 15.15.15.51 -j DROP`
- Each rule has two components. **Matching Component**=*[-s 15.15.15.51]* and **Target Component**=*[-j DROP]*
- You can match by protocal type, destination or source address, destination or source port, input or output interface, headers, etc.
- The target component is the action when there is a matching component that is satisfied.
  1. **Terminating Targets** - Ends any further traversal of the packet in the chain.
     - ACCEPT
     - DROP
     - QUEUE
     - RETURN
     - USER-DEFINED
  2. **Non-Terminating Targets** - Perform an action then continue the chain. 