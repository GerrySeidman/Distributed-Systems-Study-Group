# Open Tasks Seeking Volunteers

Seeking Volunteers to research, document and prepare to mentor others on one or more of items (1-6)

## Setting up VMs

See the notes on the VM page, but basically we're going to have different people explore each option. 
On 12/10 we tried to do this as a group with spotty success.  I updated the [VM [VirtualBox](../vms/VirtualBox.md) page with some other links.

Ideally everyone has their VMs set up in the same way.  We tried it using desktop VMs using VirtualBox/Hyper-V, but that proved difficult and unreliable.

We are going to set up at least 3 (ideally 3) VMs for our distributed systems

Options to do this on a public cloud would be better, but not free.

1. <a name="1"></a>Google Cloud instances
    * Explore getting free accounts or accounts with credits
        * Cost of VMs with at least 4Gb RAM and 25Gb Disk 
    * Explore setting up VMs with Ubuntu Server 18.04
    * Explore setting up private networks between the VMs
        * They will still need a public IP address with the ability to specify port mappings to the internal VMs
    * Update our [Google Cloud Github Page](../vms/GoogleCloud.md) with notes and Gotchas
        * Verify that you can get it to work (reproducibly)
        * Documenting the steps on our GitHub page or any thing not obvious or differnt that you had to do from a references link.
    * Be prepared to show people how to do it on Dec 17

1. <a name="2"></a>AWS Cloud instances
    * Explore getting free accounts or accounts with credits
        * Cost of VMs with at least 4Gb RAM and 25Gb Disk 
    * Explore setting up VMs with Ubuntu Server 18.04
    * Explore setting up private networks between the VMs
        * They will still need a public IP address with the ability to specify port mappings to the internal VMs
    * Update our [AWS Github Page](../vms/AWS.md) with notes and Gotchas
        * Verify that you can get it to work (reproducibly)
        * Documenting the steps on our GitHub page or any thing not obvious or differnt that you had to do from a references link.
    * Be prepared to show people how to do it on Dec 17

1. <a name="3"></a>Azure Cloud instances
    * Explore getting free accounts or accounts with credits
        * Cost of VMs with at least 4Gb RAM and 25Gb Disk 
    * Explore setting up VMs with Ubuntu Server 18.04
    * Explore setting up private networks between the VMs
        * They will still need a public IP address with the ability to specify port mappings to the internal VMs
    * Update our [Azure Github Page](../vms/Azure.md) with notes and Gotchas
        * Verify that you can get it to work (reproducibly)
        * Documenting the steps on our GitHub page or any thing not obvious or differnt that you had to do from a references link.
    * Be prepared to show people how to do it on Dec 17

1. <a name="4"></a>VirtualBox local VM instances
    * On 12/10 we tried to do this as a group with spotty success
    * Experiment with those instructions and put any 'gotcha' notes onto that page 
    * Update our [VirtualBox Page](../vms/VirtualBox.md) with notes and Gotchas 
        * Verify that you can get it to work (reproducibly)
        * Documenting the steps on our GitHub page or any thing not obvious or differnt that you had to do from a references link.
        * Note that I already put some good links and new material (and removed the old confusing instructions).
        *  Please read what I did first you don't double documents
        * You still have to set up steps and verify that it works
    * If you really want to look at my old/dated notes (which proved to confuse people) they can be found in the Git branch [`with-bad-virtualbox-notes`](https://github.com/GerrySeidman/Distributed-Systems-Study-Group/tree/with-bad-virtualbox-notes)
    * Be prepared to show people how to do it on Dec 17

## Install Docker and Docker Registry & Set up Kubernetes Cluster

5. <a name="5"></a>Set up Docker and Docker Registry
    * Install Docker on each VM
        * Verify that it works on each VM
    * Install a private Docker Registry on ONE of the machines
        * Verify that you can push/pull images from each VM machine
        * HINT: you will probably need to add the IP address of the VM with the Docker Registry to the file `/etc/docker/daemon.json`
        * To do that you need to add an `"insecure-registries"  ` element to that file.
            * in my private cluster my Docker Registry is running on the machine `iron-hill-4.auristor.io` at port 5000.  You will probably need to put the static IP address of the machine with your Registry

``` json
{
 "insecure-registries":["iron-hill-4.auristor.io:5000"],
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
```
6. <a name="6"></a>Set up a Kubernetes Cluster.  Gerry will take the lead on this, but other 'volunteers' are welcome to help documenting this.

* Installing kubeadm on all VMs machine
* Create Master Node on one VM
* Join each VM to the Kubernetes Cluster
 
<a name="1"></a>