##Metasploitable

###Description

Metasploitable poses the challenge of identifying a vulnerable server,
enumerating the services and ports, and using the Metasploit Framework
to gain access to the server. Finally, you will locate and exfiltrated
capture the flag target cards and provide the hashes of the image files
for scoring.

###Background

Identifying servers on your network and determining their
vulnerabilities is an important skill for penetration testers and system
administrators. Using tools, like nmap and the Metasploit Framework, you
can learn about the threats to your servers.

The nmap tool, or network mapper, is a comprehensive, free, open source
network scanning tool. It is used by penetration testers, network
administrators, and hackers to examine a server. It can be used on a
single host or a network segment/ip range. Nmap manipulates TCP flags to
elicit information. By analyzing TCP and UDP probes and comparing them
against fingerprints of defined responses nmap can:

    • Detect/discover live hosts on a network (server/host discovery),
    • Identify active UDP and TCP ports (port enumeration) 
    • Identify software version information for open ports (service discovery)
    • Identify operating system information;
    • Detect potential vulnerabilities and security holes.

-   -   -   -   -   

The Metasploit Framework is a part of Kali Linux or can be installed
separately on Windows or Linux/UNIX operating systems. It provides a
platform that can be used for penetration testing. Metasploit can help
to identify, validate, and exploit known vulnerabilities in operating
systems, applications, and hardware. It can also be used to develop new
exploits.

Three key components are:

  • **Exploits** – the method of exploiting a vulnerability in an asset. MSF currently has > 1,900 exploits.

  • **Payloads** – the code that can be run on a target that has been compromised. MSF currently has > 550 payloads.

  • **Auxiliary modules** – the programs that can perform fuzzing, scanning, and sniffing. MSF currently has > 1,000 auxiliary modules.

-   -   -   

###Learning Objectives

At the end of this scenario, the participants will:

1. Be able to perform network reconnaissance, server enumeration, port and service enumeration using nmap to identify a vulnerable Linux server on an isolated network;
2. Be able to run the Metasploit framework on a Linux virtual machine;
3. Be able to identify a relevant exploit to use to gain command line access to a Linux server;
4. Locate and hash any of the following cards: joker, 2 of spades, 10 of spades, king of spades, 6 of clubs, 8 of clubs, 10 of clubs, ace of clubs, 3 of hearts, 5 of hearts, 8 of hearts, 5 of diamonds, 7 of diamonds, 9 of diamonds.

###Instructions

Connect to the VM via your instructor’s directions, or as displayed on
your EDURange account.

Begin the process by getting information about the VM that you are
connecting to using ssh. Commands that might be helpful include
ifconfig, hostname, netstat, uname, etc. Once you have gained knowledge
about your VM you need to look on the closed network (10.0.\*) to find
any other VMs that are potential targets. Use nmap to scan the network
and find the available servers. Once you have identified the available
servers you then need to gain additional information about the server
including open ports, services running on those ports, versions of
software running on those ports. Again, you can use nmap to perform all
these actions. Once you have detailed as much information about the
target as possible, you can turn to the Metasploit Framework to identify
potential exploits and breach the server.

###Typical process:

    1. Gain info about your virtual machine (Linux commands)
    2. Identify the servers on the network segment (nmap).
    3. Identify the open ports on a specific server (nmap).
    4. Identify the services and version info on a specific server (nmap)
    5. Search Metasploit for exploits, auxiliary modules, and payloads for the identified services.
    6. Attempt to gain access to the target server (MSF, Web/SQL Injection)
    7. Identify other accounts on the system (/etc/passwd, /etc/shadow).
    8. Find a way to escalate privilege to gain root access.
    9. Locate the capture the flag (CTF) target files.
    10. Perform any work needed on the CTF target files so that you can hash the file.

A key feature of MSF is the ability to search.  

Below are some examples of searches you might perform:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> `search target:linux` -- returns linux exploits

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> `search vsftp` -- returns exploits related to vsftp

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> `search ftp` -- returns exploits, auxiliary modules, and payloads

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> `search drupal` -- returns exploits and auxiliary modules

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> `search mysql` -- returns exploits, auxiliary modules, and payloads 

- - - - - 
####Other key MSF commands: 
#####(commands are in bold, arguments highlighted)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5 > **use** `auxiliary/scanner/ftp/ftp\_version`

- If successful, this would set your context to this exploit.  You can see that this happened by looking at the new prompt.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5 auxiliary(scanner/ftp/ftp\_version) > **show** `options`

- Shows you the options that are available for the specific context

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> **back**

- Change context back one level

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> **set** `RHOSTS <ip-address>`

- Sets the remote host to be the specific ip-address

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> **set** `VERBOSE true`

- Sets the verbose option to true so that more feedback is displayed during exploits.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> **show** `payloads`

- Displays payloads that are usable in the current context.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> **exploit**

- Attempts the current exploit.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> **sessions**

- Displays open sessions.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msf5> **quit**

- Exits msfconsole.



You can also run some Linux commands while in the msfconsole including:
pwd, ls, cat. This can be helpful if you want to work with user id files
or password files.

Also, once you are using an exploit that gains you access to a server,
you can try to run OS commands to get additional information.

- - - - - - - 
###Hints

####Using nmap:

- `nmap -sn 10.0.0-100.0-100`
	- performs a ping scan on all IPs in the specified range
	- output indicates all IPs that respond to the ping scan and MAC address.

- `nmap -sV 10.0.0.1`
	- Output includes port, state, service, version for TCP ports, and MAC address.


- `nmap -sT -sV -sC -v -p <ports-to-scan> --reason --open <ip-address>`
	- Output includes specific ports, states, services, and versions of software for TCP ports for the specified ip-address. 


####Gaining access:
    • FTP and ssh are great avenues for accessing the system.  
    • Using an ssh_login scanner is a great way to attempt passwords to gain access.
    • Use a SQL injection to attack a website on the target using lynx (a text browser).

-   -   -   

####Escalation:
    • Gain access to the server and get a dump of the /etc/passwd file to identify users.
    • Use the ssh_login scanner to attempt typical passwords.
    • Get access to the /etc/shadow file to identify password hashes.


-   -   -   

####SQL Injection:
- There are typical attacks that can be used to enumerate the users on the system.  (And other info if you are diligent!).  Do some Google searches for SQL injection!

-   -   -

Incorrectly filtered escape characters [Wikipedia Reference](https://en.wikipedia.org/wiki/SQL\_injection) :  
This form of injection occurs when user input is not filtered for escape characters and is then passed into an SQL statement.  
This results in the potential manipulation of the statements performed on the database by the end-user of the application.   

- The Following line of code illustrates this vulnerability:
	- `statement = "SELECT * FROM users WHERE name = '" + userName + "';"`

This SQL code is designed to pull up the records of the specified username from its table of users.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;However, if the "userName" variable is crafted in a specific way by a malicious user, the SQL   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;statement may do more than the code author intended. For example, setting the "userName" variable as: 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`' OR '1'='1`

renders one of the following SQL statements by the parent language:  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `SELECT * FROM users WHERE name = '' OR '1'='1';`  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `SELECT * FROM users WHERE name = '' OR '1'='1' -- ';`  

If this code were to be used in an authentication procedure then this example could be used to force the   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;selection of every data field (\*) from all users rather than from one specific user name as the coder   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intended, because the evaluation of '1'='1' is always true.

It is also possible to use the UNION SELECT to pull data from database tables using (for example):  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`' OR 1=1 UNION SELECT null,null,username,password FROM users#`


####File work:
    • Files may be txt, zip, wav, pcapng!  And some may be hidden inside files! Some may be hidden in super-secret directories and not named like a card!  
    • Some of the files can be hashed as is to get the answer.  Some, however, require some work.
    • Exfiltrate the files from the target VM to your NAT VM.  Then exfiltrated the files to your local computer to view the files (to verify if they are viewable without modification or require modifications).  Use md5sum to get the hash of the file.
    • Tools that might be helpful working on the more difficult files: exiftool, binwalk, fcrackzip, gimp, Wireshark, base64, and mount.

