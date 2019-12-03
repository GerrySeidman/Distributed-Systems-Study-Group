# Setting up the Stem VM 

In this lab you well create a base Virtual Machine Image that will be used as the "Stem" from which all other VMs in this project will be cloned.

The steps in this lab will be:

1. Install VirtualBox 
2. Created/configure a Virtual Box Host-Only Adapter
3. Create a VM with the VirtualBox name "Tutorial Stem"
4. Install the base Ubuntu Linux from downloaded ISO file onto "Tutorial Stem"
5. Configure  the Tutorial Stem's Host-Only adapter with the static IP 192.168.10.100 
6. Specify the DNS server to be used for the cluster's private network, `play.gerry`
7. Have Set the host name for the Tutorial Stem to 'stem1'
8. Have set up Network Time Protocol (NTP)  

> For those familiar with setting up Ubuntu 16.04 and VirtualBox Networking, you can go straight to Steps 5.    Of note is the specifying the DNS server in `/etc/network/interfaces` in anticipation of the later step of setting up DNS.

After completing this lab you will have a VirtualBox VM configured with
* Ubuntu 16.04 installed on a machine with hostname `stem1.play.gerry`
* Two network adaptors
	* Private Host-only adapter with  static IP address 192.168.10.100
	* NAT Network adapter for access to the internet
* Network Time Protocol installed

# Approach


For this tutorial environment, we will be setting up a all VMs as VirtualBox VMs on the local laptop.  

We will first create a "Stem Cell" VM image.  The Stem will be the basis for all the VMs we are using. All other VMs will be VirtualBox "link cloned" from this Stem image. which has the common preparation before any machine specific setup. 

	TO-DO: Eventually we want to automate this with Vagrant and Ansible (or other such tools).
    
The Stem Image will be configured with

* Ubuntu 16.04 
* A Host-Only adapter for a local private network shared by the VMs and the Host machine.  Each VM will have a unique static IP addresss. See ["Cluster Overview"](clusterOverview.md) for more details
* A NAT Network adapter with access to the internet and an IP address obtained via DHCP.  This would not be 

For this tutorial we are going to set up DNS and for our cluster use the domain name "play.gerry". 


## Linux Flavor and Version for the Tutorial

We will be using Ubuntu 16.04 for this tutorial.   Specifically, I used ubuntu-16.04.2-server-amd64.iso to build my Stem VM image.

## Installing Virtual Box

Installing up VirtualBox is outside the scope of this Tutorial.  https://www.virtualbox.org

## CREATE A Nat Network

TO DO STILL 

## Configure a VirtualBox Host-Only Network Adapter

From the Virtual Box GUI you can create or configure Host-Only Network Adapters.  These are actual adapters visible on the Host computer that can be used by VMs in setting up private networks available only to the Virtual Machines using this adapter and the Host Machine. 

We will create our private network with each VM having a unique static IP in the range 192.168.10.xx  

Below are the steps for creating the Host-Only Netw can be accomplished from the VirtualBox GUI 

* Under "File => Preferences..."
* From Pop-up Select "Network"
* Select "Host-Only" Network Tab
* Create or Select an existing "Virtual Box	Host-Only Network Adapter #4"
* This brings up a configuration dialog box
* Set the "IPv4 Address" to 192.168.10.1
* Set the "IPv4 Network Mask" to 255.255.255.0

![[Configuring Network Adapter]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/configNetworkAdapter.jpg "Configuring Network Adapter")

> Note: This will appear as an adapter on your host machine.  You will be able to see it  by running the command  `ifconfig` on Linux, `ipconfig` on Windows on your host machine to lists all adapters on your host machine.


### TODO:  NEED TO SHOW HOW TO CREATE  THE NATNETWORK

## Creating your Stem Ubuntu VM in VirtualBox

Explaining details behind creating the VM is beyond the scope of this tutorial, but below are the screens that step you through it. 

You can click on the "New" Icon on the Virtual Box Manager and follow the below steps.

>  For now you can just select  the defaults since we are just setting up a playground.


Naming and Operating System
  ![[ xxxxx ]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/40.jpg " xxxx")

> While you've selected Linux/Ubuntu here, you don't actually install it until you first start the VM (described below)

Memory Size
![[ xxxxx ]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/41.jpg " xxxx")

Hard Disk 
![[ xxxxx ]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/42.jpg " xxxx")

Select Hard Disk File Type
![[ xxxxx ]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/43.jpg " xxxx")

Storage on physical hard disk
![[ xxxxx ]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/44.jpg " xxxx")

File location and size
![[ xxxxx ]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/45.jpg " xxxx")


## Configuring your Stem VM


### Setting up the Network for your VM

You now need to setup your VM to 'detect' two network adapters upon bootup.  You accomplish this by opening up the setup GUI for the STEM VM and select the Network Option

### DO NOT DO Adapter #1 - NAT Adapter


In Tab Adapter 1: Make sure that it is enabled and Attached to the NAT

![[Enabling the NAT adapter for the VM]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/adapter1.jpg "Enabling the NAT adapter for the VM")

### DO NOT DO Adapter #1 - NAT Network Adapter

### Adapter #2 - Host-Only Adapter

In Tab Adapter 2: Make sure that it is enabled and Attached to the Host-Only Network adapter that we configured earlier

![[Enabling the Host-Only adapter for the VM]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/adapter2.jpg "Configuring Host-Only Network Adapter")



## Starting Stem VM for the First Time

It is when you start the VM for the first time that you will be prompted for the ISO image of the Ubuntu image.  If you don't already have it, you can download the Ubuntu 16.04 Server ISO image from: https://www.ubuntu.com/download/server


 ![[ xxxxx ]](https://raw.githubusercontent.com/GerrySeidman/rectangles/tutorial/images/40.jpg " xxxx")


![[Creating Host Only Network Adapter]](images/hostOnlyNetwork.jpg "Creating Host Only Network Adapter")

 ![[Network Preferences]](images/networkPreferences.jpg "Network Preferences")


At this point you have a base install of Ubuntu.  The NAT network will be configured automatically by DHCP, but we will need to set up a static IP address for the Host-Only private network.

## Setting the Static IP address

First note the network adapters available to this VM

	$ sudo ls /sys/class/net
    enp0s3 enp0s8 lo
    
> You may get different names for these adaptors
    
And you can see how these adaptors are bound with the ```ifconfig``` config.  You will notice that one of these are not bound (in my case ```enp0s8```, you may get a different name for the unused adapter)

The configuration for binding these adapters is found in the file ```/etc/network/interfaces```

``` bash
$ cat /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp0s3
iface enp0s3 inet dhcp
```

As you see, the adapter ```enp0s8``` is not configured in the file.  We add this by editing the file:

``` bash
$ sudo vi /etc/network/interfaces
```

Appending the below to the end of the file ```/etc/network/interfaces```.  Remember our unused adaptor was ```enp0s8```, you will have to use the name of your unused adapter if it is different. 

```
#The host-only network interface
auto enp0s8
iface enp0s8 inet static
address 192.168.10.100
netmask 255.255.255.0
network 192.168.10.0
broadcast 192.168.10.255
dns-nameservers 192.168.10.110
dns-search play.gerry
dns-domain play.gerry
```

> Note: The last three lines are in anticipation of our setting up DNS.  The domain name for our private network will be ```play.gerry``` See  [Cluster Overview](clusterOverview.md) and [DNS Server](dnsServer.md) to understand


## Setting `/etc/hostname	`

In anticipation of setting up DNS for the domain `play.gerry` we will set up this Stem VM to have the name `stem1.play.gerry`.  To do this, simply replace the name of this machine in the single line in the `/etc/hostname` file

```bash
$ cat /etc/hostname
ubuntu-1
$ sudo vi /etc/hosts
$ cat /etc/hostname
stem1.play.gerry
````

## The `/etc/hosts`

Since we are relying on DNS resolution, we remove the non-localhost mapping for the default name

``` bash
$ cat /etc/hosts
gerry@afs1:~$ cat /etc/hosts
127.0.0.1       localhost
127.0.1.1       ubuntu-1      <<< LINE TO REMOVE:

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

```bash
$ sudo vi /etc/hosts
$ cat /etc/hosts
127.0.0.1       localhost

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

# DHCP Client

Edit `/etc/dhcp/dhclient.conf``

Uncomment or just add the single line

	prepend domain-name-servers 192.168.10.110;


## Setting up Network Time Protocol (NTP)

***ONLY FOR BARE METAL (NOT FOR VMS OR CONTAINERS)***

> The Kerberos protocol is sensitive to time differences between the KDC and a Kerberos client application.  As such it is necessary to  run a time synchronization service, such as NTP, on your KDC.

***Install NTP with (ONLY FOR BARE METAL... NOT FOR VMs or CONTAINERS)*** 
```bash
sudo apt install ntp	
```
## Update all packages

Update all installed packages.  
```
sudo apt update

sudo apt upgrade -y
```
> Note: I am not sure if this/when this may be done automatically.   For example sometimes you get a 'locked' error.  I suspect that is because it is already running.

## The Linux Kernel Version

The AuriStor package files (.deb) are available on the AuriStor repository for most kernel versions. While unlikley, it is possible that the packages have not yet been built for the Ubuntu Kernel Version you have installed.

To find out your Linux Kernel version:  
    
>
```
$ uname -r
4.4.0-87-generic
```

Refer to the section [Getting the AuriStor Software]("getAuriStorSoftware.md") to see which kernel versions are available.

If you do not find a matching package file, you will have to downgrade your kernel.  In structions can be found in [Downgrading your Kernel]("downgradingKernel.md")


## Links to Sample Files from this Lab

* The following files will have been edited in this lab
	* /etc/network/interfaces
	* /etc/hosts
	* /etc/hostname
	* 
