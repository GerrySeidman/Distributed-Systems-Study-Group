
## Network Topology

The network topology will include a local private network (Host-Only Adapter) for all the servers.  During development a NAT network adapter will also be on each machine for access to download software.  Ultimately the NAT network will be disabled and/or a Firewall would be set up.


## Example 

Below is an example setup.  If you set have set up DNS for under a primary "dssg" network

| Type | Description | Host Name(s) | Static IP(s) |
| --- | --- | --- | --- |
| DNS | DNS Server | dns1.dssg | 192.168.10.110 |
| Kubernetes Nodes | Master and| kube1.dssg  (+) | 192.168.10.120 (+) |
| In-Network Cluster Host | Testing inside Cluster Network | client.dssg| 192.168.10.130 |
| Your Laptop | On Home NAT | (your machine) | (your IP) |

> (+) In production there will be multiple machines for each of these servers.   In this tutorial we will only be running multiple file servers (afs2, afs3)

> Note: In the above, every server running on a different machine. It is also possible to run multiple servers on the same machine.  While this makes sense in testing/local environments, for completeness in this tutorial we will run everything on different machines to stress the 'best practices' and correct configurations.

> Once everything is set up, any machine on the Host-Only or NAT network should be able to access the AuriStor Servers in our playground.  We will instantiate a client machine in the Host-Only network for testing, though we should also be able to access it from any machine on the NAT or beyond (with port forwarding)