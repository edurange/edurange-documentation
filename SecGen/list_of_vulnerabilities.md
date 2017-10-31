# List of Vulnerabilities Currently Supported by [SecGen](https://github.com/cliffe/SecGen)
This document kept here to allow EDURange developers to easily and at-a-glance see which types of vulnerabilities SecGen currently supports.

Each vulnerability module is contained within the [modules/vulnerabilies](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities) directory tree, which is organised to match the Metasploit Framework (MSF) modules directory structure. For example, the distcc_exec vulnerability module is contained within: [modules/vulnerabilities/unix/misc/distcc_exec/](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/misc/distcc_exec). 

This document was produced by a script and is not comprehensive. Refer to the modules and their `secgen_metadata.xml` files for detailed information. The root of the module directory always contains a `secgen_metadata.xml` file and also contains puppet files, which are used to make a system vulnerable.

---

## access_control_misconfiguration
### Readable Shadow File
> Changes permissions on shadow file to 0622, reveals password hashes to local users. This is not a common misconfiguration, and not particularly subtle.

**Module Link:** [Readable Shadow File](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/access_control_misconfigurations/readable_shadow)  

### SUID root nano
> Mis-configure nano file permissions to run with root privileges

**Solution:** Nano text editor running as root user  
**Module Link:** [SUID root nano](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/access_control_misconfigurations/suid_root_nano)  

### SUID bash root
> Mis-configure /bin/bash with 4777 (suid, rwxrwxrwx) to enable root privileges

**Solution:** Bash shell running with root permissions due to suid bit set (try /bin/bash -cp "some_command")  
**Module Link:** [SUID bash root](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/access_control_misconfigurations/uid_bash_root)  

### SUID less root
> Mis-configure files to enable root privileges

**Solution:** Less editor running as user root  
**Module Link:** [SUID less root](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/access_control_misconfigurations/uid_less_root)  

### SUID vi root
> Mis-configure files to enable root privileges

**Solution:** Vi text editor running as user root  
**Module Link:** [SUID vi root](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/access_control_misconfigurations/uid_vi_root)  

### Writable Group File
> Changes permissions on /etc/group file to 0777, local users can escalate to root by adding account to sudo. 

**Difficulty:** medium  
**Solution:** Edit the /etc/group file and add user account to sudo group.  
**Module Link:** [Writable Group File](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/access_control_misconfigurations/writable_groups)  

### Writable Passwd File
> Changes permissions on passwd file to 777, open to account tampering to local users. This is not a common misconfiguration, and not particularly subtle.

**Difficulty:** medium  
**Module Link:** [Writable Passwd File](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/access_control_misconfigurations/writable_passwd)  

### Writable Shadow File
> Changes permissions on shadow file to 777, open to account tampering to local users. This is not a common misconfiguration, and not particularly subtle.

**Difficulty:** medium  
**Solution:** Edit the shadow file to set a password for root  
**Module Link:** [Writable Shadow File](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/access_control_misconfigurations/writable_shadow)  

## bash
### Bashbug / Shellshock
> Installs GNU bash version 4.1 which contains the bashbug / shellshock vulnerability.

**Difficulty:** medium  
**Module Link:** [Bashbug / Shellshock](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/bash/shellshock)  
**References:**
* https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6271
* http://www.symantec.com/connect/blogs/shellshock-all-you-need-know-about-bash-bug-vulnerability

## ctf_challenge
### Hidden Linux File
> Linux hidden file challenge. Creates a file containing a flag with a leading dot. e.g. '.hidden' 

**Solution:** List all files in a directory including hidden files with 'ls -a [directory]'. Omit the [directory] to list those in the current working directory.   
**Module Link:** [Hidden Linux File](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/ctf/hidden_file)  

## desktop_environment
### XFCE w/ LightDM Root Login
> Configures XFCE w/ LightDM to automatically login as root without a password.

**Module Link:** [XFCE w/ LightDM Root Login](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/desktop/xfce_lightdm_root_login)  

## ftp
### ProFTPD v1.3.3c Backdoor Command Execution
> A backdoor was introduced into the proftpd-1.3.3c.tar.[bz2|gz] archive between November 28th and December 2nd 2010. 

**Difficulty:** low  
**Solution:** Remotely exploitable backdoor in the FTP service  
**Module Link:** [ProFTPD v1.3.3c Backdoor Command Execution](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/ftp/proftpd_133c_backdoor)  
**References:**
* https://www.rapid7.com/db/modules/exploit/unix/ftp/proftpd_133c_backdoor

### VSFTPD v2.3.4 Backdoor Command Execution
> A backdoor was introduced into the vsftpd-2.3.4.tar.gz archive between June 30th 2011 and July 1st 2011. AKA the smiley face backdoor.

**Difficulty:** low  
**Solution:** Remotely exploitable backdoor in the FTP service  
**Module Link:** [VSFTPD v2.3.4 Backdoor Command Execution](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/ftp/vsftpd_234_backdoor)  
**References:**
* https://www.rapid7.com/db/modules/exploit/unix/ftp/vsftpd_234_backdoor
* http://scarybeastsecurity.blogspot.co.uk/2011/07/alert-vsftpd-download-backdoored.html

## irc
### UnrealIRCd 3.2.8.1 Backdoor
>  Backdoored version of the UnrealIRCd 3.2.8.1 introduced to some file mirrors in November 2009 

**Difficulty:** low  
**Module Link:** [UnrealIRCd 3.2.8.1 Backdoor](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/irc/unrealirc_3281_backdoor)  
**References:**
* https://www.unrealircd.org/txt/unrealsecadvisory.20100612.txt
* https://www.rapid7.com/db/modules/exploit/unix/irc/unreal_ircd_3281_backdoor
* https://github.com/Tehnix/puppet-unrealirc

## privilege_escalation
### chkrootkit 0.49 privilege escalation
>  chkrootkit 0.49 and earlier contain a local privilege escalation vulnerability allowing a non-root user to place a script in /tmp that will be executed as root when chkrootkit is run. This module adds a cronjob to run chkrootkit periodically for exploitability. 

**Difficulty:** high  
**Module Link:** [chkrootkit 0.49 privilege escalation](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/local/chkrootkit)  
**References:**
* https://www.rapid7.com/db/modules/exploit/unix/local/chkrootkit
* http://seclists.org/oss-sec/2014/q2/430

## access_controls
### Nmap Setuid
> Nmap setuid local privilege escalation

**Difficulty:** medium  
**Module Link:** [Nmap Setuid](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/local/setuid_nmap)  

## distcc
### DistCC Daemon Command Execution
> Distcc has a documented security weakness that enables remote code execution.

**Difficulty:** medium  
**Solution:** Distcc is vulnerable, and on a high port number.  
**Module Link:** [DistCC Daemon Command Execution](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/misc/distcc_exec)  
**References:**
* https://www.rapid7.com/db/modules/exploit/unix/misc/distcc_exec
* OSVDB-13378

## bash
### Shellshock + Apache CGI
> Shellshock + Apache CGI wrapper module, enables a remote root_rwx vulnerability. 

**Difficulty:** high  
**Module Link:** [Shellshock + Apache CGI](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/misc/shellshock_apache_cgi)  
**References:**
* https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6271
* http://www.symantec.com/connect/blogs/shellshock-all-you-need-know-about-bash-bug-vulnerability

## nfs
### NFS Share Leak
> NFS misconfigured to be mountable from anyone that can interact with it, sharing something extra.

**Difficulty:** low  
**Solution:** NFS can be mounted to access files  
**Module Link:** [NFS Share Leak](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/nfs/nfs_overshare)  
**References:**
* http://nfs.sourceforge.net/#section_c

### NFS Read-write Access to FS
> NFS misconfigured to be mountable from anyone that can interact with it, with full read write access to /.

**Difficulty:** low  
**Solution:** NFS can be mounted to access files  
**Module Link:** [NFS Read-write Access to FS](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/nfs/nfs_rootshare)  
**References:**
* http://nfs.sourceforge.net/#section_c

## samba
### Samba Public Writable Share
> Samba file server configured with a public anonymously accessible share with read / write permissions. 

**Difficulty:** low  
**Module Link:** [Samba Public Writable Share](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/smb/samba_public_writable_share)  
**References:**
* http://allarsblog.com/2015/11/07/Setting-Up-Samba-No-Security/

### Samba Symlink Traversal
> Samba file server configured with a public anonymously accessible share with read / write permissions and the unix extensions = yes, wide links = yes and allow insecure wide links = yes settings. 

**Difficulty:** low  
**Module Link:** [Samba Symlink Traversal](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/smb/samba_symlink_traversal)  
**References:**
* https://www.samba.org/samba/news/symlink_attack.html
* https://www.rapid7.com/db/modules/auxiliary/admin/smb/samba_symlink_traversal

## system
### Crackable User Account
> Unprivileged user account with a weak password.

**Module Link:** [Crackable User Account](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/system/crackable_user_account)  
**References:**
* https://forge.puppet.com/puppetlabs/accounts

### Passwordless User Account
> Unprivileged user account with no password.

**Solution:** Sometimes linux user accounts can have no password. 'ls /home/' and then switch user with 'su account_name'   
**Module Link:** [Passwordless User Account](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/system/passwordless_user_account)  
**References:**
* https://forge.puppet.com/puppetlabs/accounts

### Leaked SSH keys
> Adds a ssh enabled account which has keys leaked in a local user's home directory.

**Solution:** Extract the archive with tar -xvzf /path/to/.ssh.tar.gz, ensure ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub are in place, connect with ssh user@localhost   
**Module Link:** [Leaked SSH keys](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/system/ssh_leaked_keys)  
**References:**
* https://forge.puppet.com/puppetlabs/accounts

### SSH root login
> Enables root login to ssh. Adds a weak crackable root password by default, which can be overwritten.

**Solution:** Use a ssh bruteforce/dictionary cracker, connect with ssh root@victim-IP-address   
**Module Link:** [SSH root login](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/system/ssh_root_login)  

### symlinks
> exploits symlink to shadow, weak password so users can crack the hash

**Module Link:** [symlinks](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/system/symlinks)  

### 2x Shell Module
> Creates a C file and a shell executable with permissions within two user directories. Drops a flag in a user's home directory. 

**Solution:** Try to combine the two binaries to make something interesting happen.  
**Module Link:** [2x Shell Module](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/system/two_shell_calls)  

## webapp
### Gitlist 0.4.0 RCE
>  Gitlist before 0.5.0 allows remote attackers to execute arbitrary commands via shell metacharacters in the file name in the URI of a request for a (1) blame, (2) file, or (3) stats page, as demonstrated by requests to blame/master/, master/, and stats/master/. 

**Difficulty:** low  
**Module Link:** [Gitlist 0.4.0 RCE](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/webapp/gitlist_040)  

### MoinMoin v1.9.5
>  Moin v1.9.5 released in December 2012 contains multiple vulnerabilities. Remote code execution possible in MoinMoin v1.9.5 twikidraw and anywikidraw modules. Path traversal found in AttachFile. 

**Difficulty:** medium  
**Solution:**  Remote code execution possible in twikidraw and anywikidraw modules. Path traversal found in AttachFile module.   
**Module Link:** [MoinMoin v1.9.5](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/webapp/moinmoin_195)  
**References:**
* https://moinmo.in/SecurityFixes
* http://hg.moinmo.in/moin/1.9/rev/7e7e1cbb9d3f
* https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6081

### Online store website
> Online store website

**Solution:** You can dump the database with the following command: 'sqlmap --url=http://url:port/product?filter=* --dump' and follow the instructions when prompted.  
**Module Link:** [Online store website](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/webapp/onlinestore)  

