# Setting up VMs using Virtual Box 

External Links
* [Virtual Box Website](https://www.virtualbox.org/)


## Caveat  about this Starter Tutorial (Needs Updating)

Gerry wrote this several years ago. It was during his setting up a set of VMs with a DNS server, Kerberos and AuriStor.  


* As it is, it may no longer be 100% correct (as it is dated and has steps we don't need I have not included

    * >  If someone wants to modernize this, please feel free

* This was written prior to containerizing many of the components and running them in Kubernetes which simplified the DNS part

* [Optional] You can do the extra work to set up your own DNS, but that adds complexity that may be confusing. Only do this if you are curious about setting up DNS.
    * >Your Kubernetes Cluster will automatically set up it's own internal DNS for your 'service mesh'.  The only real benefit is that the nodes in your Kubernetes cluster and your Docker Registry can be referenced by name rather than hard coded static IP addresses.
    * > Since we are running our cluster using a Virtual Box network adapter on a subnet that you control, you don't have to worry about IP addresses changing

* Kerberos is not needed (so I left that section out)

* There are still many references to AuriStor.  I have left out the Kerberos and AuriStor specifc steps

# Audience

The target audience for this tutorial i s anyone planning to evaluate or support a production compute cluster and wants to understand how everything fits together. While many of you will be intimately familiar with VMs, Linux, etc.,  this tutorial will assume nothing and walk through all the steps to create a  playground environment working locally as a collection of Virtual Machines running on your desktop/laptop.  For example these VMs might be to run Kubernetes nodes for a container deployed system.


The target audience for this tutorial Stem is anyone planning to evaluate or 

# Preparatory Steps

In the first few steps we'll set up a "Stem Cell" (my term) VM that has the base operating system and network configured.   We will use this to Clone all the other VM images from.  Even if you already know how to do this, please scan that section or you may miss some things.  For example we install NTP on our Stem image.

To get a full playground up and running, you may also may also want to set up DNS.


* [Setting up the Stem VM](stemVM.md)
* [Cloning a VM from Stem VM](cloningStemVM.md)
* [[Optional] Setting up DNS](../../dns/README.md)
