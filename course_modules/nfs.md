# Network From Scratch

## Learning Objectives

* Layers are a lie^H convenient fiction; packets are a sequence of
  bytes The critical question is: what component of your OS or
  application interprets subsets of the bytes in what order?
* It is of value to 'memorize' things like the Ethernet and IP
  headers; one should also be comfortable with the notion of speaking
  of layer2, 3, 4 and how these are distinct from particular
  implementations of protocols at those layers, e.g., IP is not the
  only layer 3 protocol, Ethernet not the only layer 2, etc.

  ** Example: commit the 20 bytes of IP header to memory.

* networks are *not* the links between nodes, they are simply a
  collection of nodes that has agreed (somehow, subject to a standards
  process [1] predicated on building in weaknesses for the receipient)
  to interpret a particular sequence of bytes in a consistent fashion
  (but this is a faulty assumption [2,3]);
 
  [1] Postel's Principle,  in RFC 760, "an implementation should be conservative in its sending behavior, and liberal in its receiving behavior"

  [2] Ptacek and Newsham, Insertion, evasion, and denial of service: Eluding network intrusion detection 
  [3] Sommer and Paxson, Outside the closed world: On using machine learning for network intrusion detection; 
       protocol dialects, optional extensions, LangSec, etc.

* an appreciation for seeing the 'network' as a resource you can read
  from and write to; particularly Ethernet/IPv4 networks require no
  authentication or authorization; protections are non-existent or
  arise by convention only;
   
   * to the extent that things like Layer-2 authentication and
   authorization exist, particularly things like Radius, etc. these
   are not essential properties of the underlying Layer 2 and Layer 3
   protocols; and they introduce additional management complexity
   (e.g., how do you distribute credentials and shared secrets for
   what is supposed to be a broadcast medium?) Switches and routers
   no longer simply work (i.e., plug-and-communicate), but must have a
   setup step involving secure distribution of key material)

  * see the application of these ideas in 802.11 and the historic
   weaknesses in both the crypto and the encryption protocols (e.g.,
   WEP)

* The Deception Surface: the core collection of layer 2 and layer 3
  protocols that enable basic connectivity and forwarding to and from
  the local LAN

   * ARP
   * Ethernet
   * IP
   * DNS
   * DHCP
   * ICMP

* Achieve an understanding that the essential nature of the broadcast
  medium and the core protocols of the Deception Surface *rely* on the
  ability to:

  1. forge packets
  2. flood packets to the local LAN
  3. listening to "other people's" traffic
  4. pretend to be someone else (or at least authoritative)
 
  (the ability to read/write from/to the net is not inherently an evil or
  attacker capability -- in fact, basic benign functioning of the network
  depends on and demands it)

  Bottom line: the D.S. is so because a local LAN's operation demands trust

* Gain familiarity with basic tool set like:

  * ping
  * traceroute
  * ifconfig
  * ip
  * nc
  * netstat
  * route
  * arp
  * tcpdump

## Assessment questions
*
*
*
*

## Things to "see"

Diagrams:

* Ethernet RFC Header Diagram
* IP RFC Header Diagram
* ICMP RFC Header Diagram
* tcpdump packet output (Hex + ASCII)
* ifconfig(1) output
* DHCP exchange

## Narrative

The general approach is to start with no network at all, and incrementally
build an understanding of each piece of information needed to compose a
Layer 2, then a layer 3 packet.

Metaphor: Text-based adventure game. Dark room/dungeon, need to discover
and navigate your world.

Incremental goals are to reach further and further out, while overcoming
(understanding + fixing) error messages produced by your OS. For example,
goals might be:

 1. Obtaining an IP address.
 2. 


## Activity

### Layer 1: PHY

PHY is represented and interpreted by a piece of hardware (I.e., a NIC) in
your host. The OS has a custom piece of code (called a driver) to talk to
this piece of hardware. The view the OS presents to you, the user, is of
an artificial / virtual construct called an 'interface'; this is just a 
data structure.

[aside: talk about privileges and sensitive operations, need for root or
sudo]

ifconfig: 
 examine/view
 modify properties of Interfaces

### Burn it down. Get a quiet network environment.

Allocate a network interface, but no IP address.
Kill networkmanager
Shut off multicast DNS and similar services

Q: how do you know it is quiet?
Need to listen: introduce tcpdump

TCPDUMP(1)


Principle: multiple perspectives:
 - some packets are visible only by the generating host
 - by default, some layer 2 technology replicates packets to all hosts

### Hub vs. Switch

How does a hub work?

How does a switch work?
CAM table.
Fwd ptr to ARP flooding and its effect on CAM Table and switch state.
Goal: Fail open, but: some switches may crash and reboot, others may have
PortGuard(TM) or similar tech (i.e., rate limits on the number of Ethernet
MAC addresses or time/age limits on MAC addresses per port)
### Error Messages

connect: Network is unreachable.

uninformative.
NB: not "The" network
connect: syscall

### Trust Discussions

You have limited power to "force" the Internet to carry your traffic;
for the most part, this is what it is supposed to do and it does it
fairly well, but other ISPs/AN may have other ideas.

Best you can do is get your packet to a gateway on the local LAN.


### Unique names and addressing

1 shared illusion is how 'names' on the Internet are structured.
The so-called IP address is this construct.

IPv4 32 bits.
Examples of IP addresses.

but: this collection of bits actually encodes 2 quantities:

 1. the network address
 2. the host address

This is captured by the so-called 'network bitmask'

A way of dividing the IP address into two parts.

how do I claim a name?
an IP address is like both a name and an address (because it implies
routing/network structure)
IANA, but on a local LAN, there are no police. Use what you like!
see also RFCs

End-to-end semantics of the Internet.
^^^^^
This is the essence of layer 3!

