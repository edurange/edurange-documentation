
# A root terminal history

```
root@isengard:/home/locasto# history
    1  ps aux | grep Network
    2  killall NetworkManager
    3  ps aux | grep Network
    4  ifconfig enp0s3 down
    5  ifconfig
    6  clear
    7  ifconfig enp0s3
    8  ifconfig enp0s3 0.0.0.0
    9  ifconfig enp0s3
   10  ifconfig enp0s3 0.0.0.0 down
   11  ifconfig enp0s3
   12  dmesg
   13  ifconfig enp0s3 0.0.0.0 down
   14  ifconfig enp0s3
   15  ifconfig enp0s3 up
   16  ifconfig enp0s3
   17  NetworkManager 
   18  ifconfig enp0s3
   19  netstat -lptn
   20  history
root@isengard:/home/locasto#
root@isengard:/home/locasto# man ifconfig
root@isengard:/home/locasto# killall NetworkManager
root@isengard:/home/locasto# tcpdump -n -i enp0s3
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
12:50:14.370365 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
12:50:15.384562 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
12:50:16.407918 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
12:50:17.431924 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
12:50:18.455984 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
12:50:19.480170 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
12:50:20.504562 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
12:50:21.528955 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
12:50:22.552650 ARP, Request who-has 10.0.2.1 tell 10.0.2.15, length 28
^C
9 packets captured
9 packets received by filter
0 packets dropped by kernel
root@isengard:/home/locasto# 

```

# Normal User Alice Bash History

```
locasto@isengard:~$ history
    1  ping 8.8.4.4
    2  ifconfig
    3* 
    4  ifconfig enp0s3
    5  ifconfig enp0s3 up
    6  history
locasto@isengard:~$ 
```

# Error Messages

These need to be unpacked and explained; what is actually failing?

```
locasto@isengard:~$ ping 8.8.4.4
connect: Network is unreachable
locasto@isengard:~$ ifconfig enp0s3 up
SIOCSIFFLAGS: Operation not permitted
```
