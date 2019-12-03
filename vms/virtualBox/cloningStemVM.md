
# Cloning from the Stem

In this lab you learn the steps to create a Clone of the Stem VM.  This is just descriptive of the tasks that will be applied to all new VMs created in this project

The steps in this lab will be:

1. Learn how to Clone the VM in VirtualBox
2. Learn how to configure the hostname and static IP address for this VM

After this lab 

* You will know how to create clones from the Stem VM

> In the below example, the specific steps are the ones used in creating the DNS server.   You can try this for practice as 



## Link Cloning the VM in VirtualBox

![[Cloning a VM]](images/cloneVM.jpg "Cloning a VM")
> Be sure to check `Reinitializze the MAC address of the network cards`

![[Clone Type]](images/cloneType.jpg "Clone Type")
> Select Linked Clone


## Configuring the Host Name and Static IP Address

When you first boot up, the `"clone"` it is still identical to the `"stem"` so it will by still have the static IP address and host name 'stem1'

> Be sure that the Stem VM isn't running or you will have an IP address collision and you won't be able to configure the clone.

SSH into the 

To set the "clone" at the "stems" IP address, in our case 192.168.10.100

Now we can configure the new host name and IP address from those inherited from the clone of the `Stem VM`.    This is accomplished with the below commands which change the inherited hostname from the `stem1` to `dns1` and static IP address from `192.168.10.100` to  `192.168.10.110` in the appropriate configuration files.  

``` bash
export NEW_HOST=dns1
export NEW_IP=192.168.10.110

sudo sed -i -- "s/192.168.10.100/$NEW_IP/g" /etc/network/interfaces
sudo sed -i -- "s/stem1/$NEW_HOST/g" /etc/hosts
sudo sed -i -- "s/stem1/$NEW_HOST/g" /etc/hostname
sudo reboot
```

You likely will get the warning: `sudo: unable to resolve host stem1`  while you are resetting the host name, but before the reboot.  That is normal.

> These are the exact steps for preparing to set up the DNS Server which is continuted in  [Setting up the DNS Server](dnsServer.md)

We will use the same technique for all of the other VMs for this project  (but with different values for `NEW_HOST` and `NEW_IP`
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTgyMzU3NjE0M119
-->