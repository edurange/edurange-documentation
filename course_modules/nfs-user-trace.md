# User of "Alice" terminal trace/history

From 11 April.

```
locasto@isengard:~$ ifconfig
enp0s3    Link encap:Ethernet  HWaddr 08:00:27:8d:c6:73  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::680d:66ba:3fb1:9d5b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:215230 errors:0 dropped:0 overruns:0 frame:0
          TX packets:66673 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:223786773 (223.7 MB)  TX bytes:4066960 (4.0 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:256 errors:0 dropped:0 overruns:0 frame:0
          TX packets:256 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:22957 (22.9 KB)  TX bytes:22957 (22.9 KB)

locasto@isengard:~$ ifconfig hw ether 08:00:27:8d:c6:74
ether: Unknown host
ifconfig: `--help' gives usage information.
locasto@isengard:~$ ifconfig enp0s3 hw ether 08:00:27:8d:c6:74
SIOCSIFHWADDR: Operation not permitted
locasto@isengard:~$ sudo ifconfig enp0s3 hw ether 08:00:27:8d:c6:74
[sudo] password for locasto: 
locasto@isengard:~$ ifconfig
enp0s3    Link encap:Ethernet  HWaddr 08:00:27:8d:c6:74  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::680d:66ba:3fb1:9d5b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:215234 errors:0 dropped:0 overruns:0 frame:0
          TX packets:66678 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:223787247 (223.7 MB)  TX bytes:4067420 (4.0 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:260 errors:0 dropped:0 overruns:0 frame:0
          TX packets:260 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:23328 (23.3 KB)  TX bytes:23328 (23.3 KB)

locasto@isengard:~$ sudo ifconfig enp0s3 hw ether 08:00:27:aa:aa:aa
locasto@isengard:~$ ifconfig
enp0s3    Link encap:Ethernet  HWaddr 08:00:27:aa:aa:aa  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::680d:66ba:3fb1:9d5b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:215234 errors:0 dropped:0 overruns:0 frame:0
          TX packets:66678 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:223787247 (223.7 MB)  TX bytes:4067420 (4.0 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:260 errors:0 dropped:0 overruns:0 frame:0
          TX packets:260 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:23328 (23.3 KB)  TX bytes:23328 (23.3 KB)

locasto@isengard:~$ ifconfig enp0s3 192.168.25.2
SIOCSIFADDR: Operation not permitted
SIOCSIFFLAGS: Operation not permitted
locasto@isengard:~$ sudo ifconfig enp0s3 192.168.25.2
locasto@isengard:~$ ifconfig
enp0s3    Link encap:Ethernet  HWaddr 08:00:27:aa:aa:aa  
          inet addr:192.168.25.2  Bcast:192.168.25.255  Mask:255.255.255.0
          inet6 addr: fe80::680d:66ba:3fb1:9d5b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:215234 errors:0 dropped:0 overruns:0 frame:0
          TX packets:66686 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:223787247 (223.7 MB)  TX bytes:4068992 (4.0 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:276 errors:0 dropped:0 overruns:0 frame:0
          TX packets:276 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:24480 (24.4 KB)  TX bytes:24480 (24.4 KB)

locasto@isengard:~$ ping 8.8.4.4
connect: Network is unreachable
locasto@isengard:~$ sudo ifconfig enp0s3 10.0.2.15
locasto@isengard:~$ ping 8.8.4.4
connect: Network is unreachable
locasto@isengard:~$ arp -van
Entries: 0	Skipped: 0	Found: 0
locasto@isengard:~$ netstat -rn | more
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
10.0.0.0        0.0.0.0         255.0.0.0       U         0 0          0 enp0s3
locasto@isengard:~$ ping 8.8.4.4
connect: Network is unreachable
locasto@isengard:~$ netstat -rn | more
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
10.0.0.0        0.0.0.0         255.0.0.0       U         0 0          0 enp0s3
locasto@isengard:~$ ping 10.0.2.1
PING 10.0.2.1 (10.0.2.1) 56(84) bytes of data.
From 10.0.2.15 icmp_seq=1 Destination Host Unreachable
From 10.0.2.15 icmp_seq=2 Destination Host Unreachable
From 10.0.2.15 icmp_seq=3 Destination Host Unreachable
From 10.0.2.15 icmp_seq=4 Destination Host Unreachable
From 10.0.2.15 icmp_seq=5 Destination Host Unreachable
From 10.0.2.15 icmp_seq=6 Destination Host Unreachable
^C
--- 10.0.2.1 ping statistics ---
7 packets transmitted, 0 received, +6 errors, 100% packet loss, time 6134ms
pipe 4
locasto@isengard:~$ apr -van
No command 'apr' found, but there are 17 similar ones
apr: command not found
locasto@isengard:~$ arp -van
? (10.0.2.1) at <incomplete> on enp0s3
Entries: 1	Skipped: 0	Found: 1
locasto@isengard:~$
```
