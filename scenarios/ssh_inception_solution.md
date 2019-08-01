### Solution

This guide provides a brief description of the steps necessary to pass each level of ssh inception.

#### Getting to Starting Line

Students must ssh into the public instance. From there they will be instructed to `ssh 10.0.0.5` to get to Starting Line

#### Starting Line

Students must use the `-p` option in `ssh` to advance to First Stop.
For example

```
student@StartLine:~$ ssh -p 123 10.0.0.7
```

#### First Stop to Second Stop

Students must use nmap to find the right IP address for the next server. They can find their subnet by using ifconfig.

```
student@FirstStop:~$ ifconfig
eth0      Link encap:Ethernet  HWaddr 02:7f:d0:af:99:52
          inet addr:10.0.0.7  Bcast:10.0.0.31  Mask:255.255.255.224
          inet6 addr: fe80::7f:d0ff:feaf:9952/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:9016 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2426 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:13022915 (13.0 MB)  TX bytes:184629 (184.6 KB)
```
Students can determine the subnet is `10.0.0.0/27` in CIDR notation because the `inet addr` is `10.0.0.7` and `Mask` is `255.255.255.224`.
With this information we can use `nmap` on the network.

```
student@FirstStop:~$ nmap 10.0.0.0/27

Starting Nmap 6.40 ( http://nmap.org ) at 2019-07-27 01:56 UTC
Nmap scan report for 10.0.0.5
Host is up (0.00100s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for 10.0.0.7
Host is up (0.0015s latency).
All 1000 scanned ports on 10.0.0.7 are closed

Nmap scan report for 10.0.0.10
Host is up (0.0019s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for 10.0.0.13
Host is up (0.0021s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for 10.0.0.14
Host is up (0.0015s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
21/tcp open  ftp

Nmap scan report for 10.0.0.16
Host is up (0.0018s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for 10.0.0.17
Host is up (0.0019s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for 10.0.0.19
Host is up (0.0013s latency).
Not shown: 999 closed ports
PORT    STATE SERVICE
666/tcp open  doom

Nmap done: 32 IP addresses (8 hosts up) scanned in 1.73 seconds
```

The "next" host is `10.0.0.10`

#### Second Stop to Third Stop

There is a `id_rsa` private key in their home directory they can use to get to the next host.

```
student@SecondStop:~$ ssh -i id_rsa 10.0.0.13
```

#### Third Stop to Fourth Stop

Third stop has two phases. First, they need to use grep or find to search through the directory for the hidden credentials. Students cannot access Third Stop from Second Stop, because Third stop is blocking the IP of Second Stop. They must ssh to Third stop from First Stop or Starting Line.

#### Fourth Stop to Fifth Stop

Students can use `nmap` to discover that host `10.0.0.14` has port 22 for ftp open.
Then they can use `ftp` to connect, and use the username `anonymous` and any password:

```
student@FourthStop:~$ ftp 10.0.0.14
Connected to 10.0.0.14.
220 (vsFTPd 3.0.2)
Name (10.0.0.14:student): anonymous
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
200 PORT command successful. Consider using PASV.
150 Here comes the directory listing.
-r--r--r--    1 0        0              50 Jul 27 01:36 hint
226 Directory send OK.
ftp> get hint
local: hint remote: hint
200 PORT command successful. Consider using PASV.
150 Opening BINARY mode data connection for hint (50 bytes).
226 Transfer complete.
50 bytes received in 0.00 secs (800.5 kB/s)
ftp> exit
221 Goodbye.
student@FourthStop:~$ cat hint
ip: 10.0.0.17
decryption_password: 8fddakjfds0s9f
```

With this hint they can use the decryption password to get the password for the next host.

```
student@FourthStop:~$ ./decryptpass encryptedpassword
enter aes-256-cbc decryption password:
```

#### Fifth Stop to Satans Palace

On fifth stop the file `betcha_cant_read_me` is base64 encoded.
Students can decode it using `base64 --decode betcha_cant_read_me`.
This gives them the password needed to log on to satans palace.
Students can find the final host with nmap at `10.0.0.19`, and notice it has "the most evil port" `666` open.
When they log in with `ssh -p 666 10.0.0.19` they are immediately kicked out.
This can be bypassed by providing `ssh` a command to run. For example

```
ssh -p 666 10.0.0.19 cat final_flag
```

#### Final Flag

The final flag is encoded using a [caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher).

