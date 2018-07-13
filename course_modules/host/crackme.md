# Simple CrackMe Exercise Documentation

From https://pages.cpsc.ucalgary.ca/~locasto/teaching/2014/CPSC525/hw/crackme/

## Summary

Crackme' exercises are little puzzles that are inspired by games that required some passphrase 
or word from the manual: a primitive form of Digital Rights Management (DRM). Crackmes give people
practice at reverse engineering.

## Problem 3. Dynamic Analysis / Crackme (100 points)]

Crack the two programs:

http://pages.cpsc.ucalgary.ca/~locasto/teaching/2014/CPSC525/hw/crackme/simplex

http://pages.cpsc.ucalgary.ca/~locasto/teaching/2014/CPSC525/hw/crackme/game

This doesn't mean "find the valid password". Instead, you should patch
the file so that all checks are ignored and it doesn't matter *which*
license key the user supplies at the command line.  You should submit
a list of addresses, the new byte values at those addresses, and a
disassembly of the new values (use, e.g., udcli) (a diff of
disassembly output of the original vs. the modified/patched binary
should suffice).

Submit a brief 4-5 sentence statement discussing the C-I-A properties
of the anti-cracking countermeasures you found in each binary.
Discuss your role as an attacker and the implications of "physical"
access to the program binary and running process.

Note: Remember that these are 32-bit binaries.

## Example Run

TBD
