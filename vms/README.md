# Virtual Machines

We are going to set up VMs for the primary nodes of our Kubernetes Cluster.  

Instructions for setting up your VMs

* [Setting up your VMs using VirtualBox](virtualBox/README.md)

* [Setting up your VMs using Hyper-V](hyper-v/README.md)


# Setting up a "Stem" VM Image

It is a repetitive and slow process to set up a VM and install your base Linux for every node in your cluster.

While this is not necessarily 'standard' technique, it is useful for our purposes.

In the each VM section they describe out to set up a "Stem Cell" (my term) VM that has the base operating system and network configured.   We will use this to Clone all the other VM images from.  

> There are other ways to do this with things like Teraform, but that is out of the scope of this study group 


