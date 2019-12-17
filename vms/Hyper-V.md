# Setting up VMs using Hyper-V

External Links
* [Hyper-V Overview ](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/)
* [Introduction to Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/)
* [Install Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)
* [Create a Virtual Machine with Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/quick-create-virtual-machine)

- - - 
- - - 

# Setting up a "Stem" or "Base" VM Image

* Unlike VirtualBox, there is still no simple way to clone a Hyper-V VM. So it's best to follow/repeat these steps once for each VM that you want to set up.

* These instructions were developed with Hyper-V Manager Version 10.0.18362.1 on Windows Version 10.0.18362 Build 18362.

* Steps
  * Under the Actions pane (on the upper-right side), select New -> Virtual Machine
  * Under Specify Name and Location
    * Name: stem1 (or stem 2, or stem 3, etc)
  * Under Specify Generation, select Generation 1
  * Under Assign Memory, select 4096, and enable "Use Dynamic Memory for this virtual machine"
  * Under Configure Networking, select Default Switch
  * Under Connect Virtual Hard Disk
    * Select Create a virtual disk
    * Name: stem1.vhdx
    * Size: 20 GB
  * Under Installation Option
    * Select Install an operating system from a bootable CD/DVD-ROM
    * Image File (.iso): Ubuntu 18.04 Server .iso file (e.g. ubuntu-18.04.3-live-server-amd64.iso)
  * Click Finish
  * Hyper-V Manager will now show the new stem VM, but it will be powered off
    * Right-click the VM and click Connect
    * Click Start and complete the Ubuntu installation process
    

