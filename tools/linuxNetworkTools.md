
# Standard Linux Network Tools

## External Links
* [Linux Network Tools](https://gist.github.com/miglen/70765e663c48ae0544da08c07006791f#ip)

## Network Configuration and Routing

* ***ifconfig:*** This command is used to configure network interfaces, or to display their current configuration. 

* ***route:*** The route command is the tool used to display or modify the routing table. x

* ***iwconfig:*** iwconfig command in Linux is use to configure a wireless network interface. You can see and set the basic Wi-Fi details like SSID channel and encryption.

* ***ip:*** Show or manipulate routing, devices, policy routing and tunnels

## Network Traffic and DNS

* ***netstat (ss):*** Displays contents of /proc/net files. It works with the Linux Network Subsystem, it will tell you what the status of ports are ie. open, closed, waiting, masquerade connections. It will also display various other things. It has many different options. Netstat (Network Statistic) command display connection info, routing table information etc. To displays routing table information use option as -r.

* ***tcpdump:*** This is a sniffer, a program that captures packets off a network interface and interprets them for you. It understands all basic internet protocols, and can be used to save entire packets for later inspection.

* ***ping:*** The ping command (named after the sound of an active sonar system) sends echo requests to the host you specify on the command line, and lists the responses received their round trip time. PING (Packet INternet Groper) command is the best way to test connectivity between two nodes. 

* ***traceroute:*** traceroute will show the route of a packet. It attempts to list the series of hosts through which your packets travel on their way to a given destination. 

* ***tracepath:***  performs a very similar function to traceroute the main difference is that tracepath doesn't take complicated options.

* ***nmap:*** " network exploration tool and security scanner". nmap is a very advanced network tool used to query machines (local or remote) as to whether they are up and what ports are open on these machines.

* ***dig:*** Dig (domain information groper) query DNS related information like A Record, CNAME, MX Record etc. This command mainly use to troubleshoot DNS related query.

* ***nslookup:*** nslookup command also use to find out DNS related query. 

* ***host:*** host command to find name to IP or IP to name in IPv4 or IPv6 and also query DNS records.

* ***hostname:*** hostname is to identify in a network. Execute hostname command to see the hostname of your box. You can set hostname permanently in /etc/sysconfig/network. 

* ***arp:*** ARP (Address Resolution Protocol) is useful to view / add the contents of the kernel's ARP tables. 


