## ELF Infection

### Description

ELF Infection is an exercise to assess your understanding of the
structure of an executable file. The goal is to teach you, having
identified that a program is doing something malicious, where that code
has been injected and how it works. This is a reverse engineering
problem and can use a range of tools, including readelf, objdump, gdb,
strace and netstat.

### Background

One of the first things most people think of when it comes to digital
security are viruses! Being able to detect and disable malware is a
never ending job as the digital world continues to expand. The first
step towards recognizing viruses is being able to understand what is
normal behavior for a program. If you are unfamiliar with strace, and
reading system calls, you might want to do our strace exercise before
attempting ELF Infection.

As the title suggests, you will be examining the different ways ELF
files can be infected. The files in this exercise were infected with a
method called injection. 'Injection' is the process of inserting and
smuggling a malicious payload into an ELF executable without breaking
the executable's integrity.

### Learning Objectives

* Know the capabilities of readelf and how to use the basic options
* Know the format of an ELF file header
* Know which system calls do the following
  - Make a new name for a file
  - Execute a process
  - Terminate the calling process
  - Create message buffer and read from the message queue
  - Assign the local IP address and port for a socket
* Be familiar with the general classes of system calls
* Be able to read a system trace and know what is normal vs abnormal
* Be able to make a system call in C
* Be able to make a system call in x86 assembly
* Understand how the kernel handles system calls
* Understand how some system calls introduce threats
* Understand how errors are handled

### Instructions

Connect to the VM via your instructor’s directions, or as displayed on
your EDURange account.

### Lab Assignments and Question

While you are working through the scenario, try to answer the following questons:

1.) How did you determine that it was infected?

2.) What does the parasite code do?

3.) Where is the parasite code located in the ELF file?

4.) How is control redirected in the file to execute the parasite as well as the regular code?

### Discussion Questions

UNDER CONSTRUCTION
