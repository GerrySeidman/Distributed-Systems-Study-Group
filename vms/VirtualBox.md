# Setting up VMs using Virtual Box 


| foo | bar |
| --- | --- |
| baz | bim |

## External Links
* [Virtual Box Website](https://www.virtualbox.org/)

* [Setting up Ubuntu Server 18.04 on VirtualBox 6](https://hadisinaee.github.io/posts/setting-up-vbox6/)


* [How to Network Virtual Machines in VirtualBox](https://study.com/academy/lesson/)<BR> Paid Site, but the beginning is visible/useful

| VM-Host | VM-VM | VM-External network | External network-VM | VM's IP Visiblity to the External Network |
| --- | --- | --- | --- | --- |
| NAT | No | No | Yes | Yes (Port forwarding) | Hidden |
| Host-only | Yes | Yes | No | No | Hidden |
| Bridged | Yes | Yes | Yes | Yes | Visible |

## The most common network types in VirtualBox

| VM-Host | VM-VM | VM-External network | External network-VM | VM's IP Visiblity to the External Network |
| --- | --- | --- | --- | --- |
| NAT | No | No | Yes | Yes(Port forwarding) | Hidden |
| Host-only | Yes | Yes | No | No | Hidden |
| Bridged | Yes | Yes | Yes | Yes | Visible |



# Setting up a "Stem" or "Base" VM Image

It is a repetitive and slow process to set up a VM and install your base Linux for every node in your cluster.

VirtualBox has the ability to 'clone' images from other images with the clones having an 'overlay' file system on top of the clone's.  

A common technique is to create a base image of your OS (ie Ubuntu) and then create clones based on that so you don't have to do the full install again.

> There are other ways to do this with things like Teraform, but that is out of the scope of this study group 
