## Strace

Strace (dynamic analysis of binaries) poses the challenge of
understanding what a process is doing based on its system calls. You
will learn to filter large amounts of data to distinguish between normal
and anomalous behavior.

### Background

One of the important skills of cyber security is being able to analyze
malware. These skills overlap with debugging, except that the problems
can be more subtle. This exercise focuses on dynamic analysis of
programs, i.e. analyzing what a program does while it is running. It
turns out that in order to do anything, a program or process relies
heavily on the operating system. The system call (syscalls) can reveal a
lot about what the program is doing. One of the tools for examining the
syscalls is strace. You should first figure out where the strace binary
is located and what some of the options are (look at the man pages).

You will start with whitebox testing of some programs for which you have
the source code. Then, you can move to blackbox testing using trace
files. When reading through the traces, you will first need to figure
out what the system calls are doing. The system calls also have man
pages. The last strace in this example has two executables running. If
you are working in a group, think about how you can divide up the work
in an efficient way.

### Learning Objectives

* Know how to analyze the sequence of sys calls and recognize patterns
* Be able to determine if a program is behaving as expected
* Recognize when a process forks another process
* Recognize when a process opens a file or socket
* Recognize when a process deletes a file
* Recognize which system calls introduce threats and how that happens

### Instructions

Connect to the VM via your instructor’s directions, or as displayed on
your EDURange account. Follow the Lab Assignments and Questions section
below.

It may be helpful to look over the Grep and Piping and Redirecting
portions of the Student Tutorials section. They can help you filter
through the results of strace.

### Lab Assignments and Question

1.
    Your home directory contains various files that will be used in this
scenario. One is the file empty.c, whose contents are:
    ```c
    int main () {}
    ```
    Compile this program as follows:
    ```sh
    gcc -o empty empty.c
    ```
    Now run strace to execute the empty program:
    ```sh
    strace ./empty
    ```
    What do you think the output of strace indicates in this case? How many different syscall functions do you see?

2. 
    The file hello.c contains this simple program:
    ```c
    # include <stdio.h>;
    int main () {
      printf("hello\\n");
    }
    ```
    Compile `hello.c` to hello and execute it with strace:
    ```sh
    gcc –o hello hello.c
    strace ./hello
    ```
    Compare the output of strace for empty and for hello. Which part of the
strace output is boilerplate, and which part has to do with the specific
program?

3.
    The `-o` option of `strace` writes its output to a file. Do the
following:
    ```sh
    strace -o empty-trace ./empty
    strace -o hello-trace ./hello
    diff empty-trace hello-trace
    ```
    Explain the differences reported between traces empty-trace and
hello-trace. (Colordiff is installed as well.)

4.
    Study the program `copy.c`.
    ```c
    # include <stdio.h>
    # include <stdlib.h>

    int main (int argc, char** argv) {
      char c;
      FILE* inFile;
      FILE* outFile;
      char outFileName[256];

      if (argc != 3) {
        printf("program usage: ./copy <infile> <outfile>\n");
      }

      snprintf(outFileName, sizeof(outFileName), "%s/%s", getenv("HOME"), argv[2]);

      inFile = fopen(argv[1], "r");
      outFile = fopen(outFileName, "w");

      printf("Copying %s to %s\n", argv[1], outFileName);

      while ((c = fgetc(inFile)) != EOF) {
        fprintf(outFile, "%c", c);
      }

      fclose(inFile);
      fclose(outFile);
    }
    ```
    Compile it to an executable named copy and use strace to execute it as
follows:
    ```sh
    gcc -o copy copy.c
    strace ./copy tiger.txt mytiger.txt
    ```

    Explain the non-boilerplate parts of the trace by associating them with
    specific lines in copy.c. Are there any lines from the program that you
    expect to show up in the trace that don’t?

5. The file strace-identify was created by calling strace on a command.
The first line of the trace has been deleted to make it harder to
identify. Determine the command on which strace was called to produce
this trace.

6. Sometimes strace prints out an overwhelming amount of output. One way
to filter through the output is to save the trace to a file and search
through the file with grep. But strace is equipped with some options
that can do some summarization and filtering. To see some of these, try
the following, and explain the results:
    ```sh
    find /etc/dhcp
    strace find /etc/dhcp
    strace -c find /etc/dhcp
    strace -e trace=file find /etc/dhcp
    strace -e trace=open,close,read,write find /etc/dhcp
    ```

7. Here is a simple shell script in script.sh:
    ``` sh
    #!/bin/bash
    echo "a" > foo.txt
    echo "bc" >> foo.txt
    echo `id -urn` >> foo.txt
    chmod 750 foo.txt
    cat foo.txt | wc
    chmod 644 foo.txt
    ```
    Compare the outputs of the following calls to strace involving this script.
    Explain what you see in the traces in terms of the commands in the script.
    ```sh
    strace ./script.sh
    strace -f ./script.sh
    ```

8.
    The file mystery is an executable whose source code is not available.
    Use strace to explain what the program does in the context of the following examples:
    ```sh
    ./mystery foo abc
    ./mystery foo def
    ./mystery baz ghi
    ```

9.
    Create a one-line `secret.txt` file.
    Here’s an example, though of course you should choose something different as your secret:
    ```sh
    echo "My phone number is 123-456-7890" > secret.txt
    ```
    Now display the secret to yourself using cat:
    ```
    cat secret.txt
    My phone number is 123-456-7890
    ```
    Is your secret really secret? How much do you trust the cat program?
    Start by running strace on cat secret.txt to determine what it's actually doing.
    Based on this and subsequent experiments, determine answers to the following questions:
    * The cat program in the strace scenario does more than display the contents of a file? Exactly what else does it do?
    * How can you display the contents of a file without the extra actions
reported above?
    * Can anyone else read your secret?
    * Can you read the secrets of anyone else?
    * How do you think the trojaned cat program was implemented? How do you
think it was installed? Justify your explanations

### Discussion Questions

1. What are the major types of syscalls? Which ones would you look for
when black box testing?

2. Explain how you would disguise a rootkit that copies a file to a
hidden directory.

3. Explain how you would disguise a rootkit that opens a reverse shell.


