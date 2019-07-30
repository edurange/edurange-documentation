## SSH Inception

### Description

SSH Inception teaches the basics of ssh, a secure program for logging
into a remote machine. You will use ssh along with some other tools to
navigate through a series of network checkpoints.

### Background

Logging into a remote machine is one of the most basic computer
networking tasks. Knowing the different methods and options for doing so
is essential. This exercise will also introduce you to some other
helpful tools as you navigate through the checkpoints, including grep,
ifconfig, nmap and ftp. Though you will only use them briefly here, they
are each powerful tools on their own that you should investigate
further. Reading the man pages of these tools is the first place to
start if you are unsure how to tackle a problem. For nmap, be sure that
you only use it to scan the local network, which starts with 10.0.0.

For grep, you can search through a large number of files with one
command: `grep 1234 *.txt`

### Learning Objectives

* Understand what is happening when you ssh
* Understand key pairs and why they provide more protection than passwords
* Have a basic familiarity with a linux system

#### Instructions

Connect to the VM via your instructor’s directions, or as displayed on
your EDURange account. Instructions will be displayed upon logging in
and at each new checkpoint.

### Lab Assignments and Question

Questions can be found upon logging into your EDURange account.

### Discussion Questions

1. 
    Why did you see the following message when you used ssh the first
time to connect to the NAT?
    ```
    The authenticity of host [IP address] can't be established.
    ECDSA key fingerprint is SHA256:[hash value].
    ```

2. What were some of the different ways each network limited or allowed
a user to login?

3. How were you able to get access to the loose ftp server? Was there
another way to gain access? What could be done to secure the ftp server?

4. How was the file `betcha_cant_read_me` decoded? What are some
other similar methods?

5. The final problem in this exercise is a bit challenging and will
require some creative thinking. Why was it difficult to stay in Satan’s
Palace? There are multiple ways to get what you are looking for. Share
with classmates how you achieved your goal. Do you understand why these
different methods worked?
