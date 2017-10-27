# List of Vulnerabilities Currently Supported by [SecGen](https://github.com/cliffe/SecGen)
This document kept here to allow EDURange developers to easily and at-a-glance see which types of vulnerabilities SecGen currently supports.

Each vulnerability module is contained within the [modules/vulnerabilies](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities) directory tree, which is organised to match the Metasploit Framework (MSF) modules directory structure. For example, the distcc_exec vulnerability module is contained within: [modules/vulnerabilities/unix/misc/distcc_exec/](https://github.com/cliffe/SecGen/tree/master/modules/vulnerabilities/unix/misc/distcc_exec). 

The root of the module directory always contains a secgen_metadata.xml file and also contains puppet files, which are used to make a system vulnerable.

---

## access_control_misconfigurations
readable_shadow
suid_root_nano
uid_bash_root
uid_less_root
uid_vi_root
writable_groups
writable_passwd
writable_shadow

## bash
shellshock

## ctf
defcon_quals_2016
hidden_file
java

## desktop
xfce_lightdm_root_login

## ftp
proftpd_133c_backdoor
vsftpd_234_backdoor

## irc
unrealirc_3281_backdoor

## local
chkrootkit
setuid_nmap

## misc
distcc_exec
shellshock_apache_cgi

## nfs
nfs_overshare
nfs_rootshare

## smb
samba_public_writable_share
samba_symlink_traversal

## system
crackable_user_account
passwordless_user_account
ssh_leaked_keys
ssh_root_login
symlinks
two_shell_calls

## webapp
gitlist_040
moinmoin_195
onlinestore
