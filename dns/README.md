
# Setting up the DNS Server

In this lab you will set up the DNS server for this project

The steps in this lab will be:

1. Create a clone VM for the DNS Server
2. Install the DNS Server software, `bind9`
3. Configure the DNS server for the private network `play.gerry`
4. Create DNS entries for all the machines that will be used in this project

After completing this lab:

* DNS will be set up for all the machines in the project's cluster


## Create a new VM for the DNS Server

Clone VM and configure from the 
``` bash
export NEW_HOST=dns1
export NEW_IP=192.168.10.110

sudo sed -i -- "s/192.168.10.100/$NEW_IP/g" /etc/network/interfaces
sudo sed -i -- "s/stem1/$NEW_HOST/g" /etc/hostname
sudo reboot
```

## Install Bind9

```
sudo apt install bind9
```

## Configuring the ```play.gerry``` Domain

Create `/etc/bind/play.gerry`

```
;
; zone file for play.gerry
;
@ IN SOA DNS1.PLAY.GERRY. GERRY.AURISTOR.COM. (
        4203    ; Serial
        10800   ; Refresh after 3 hours
        3600    ; Retry after 1 hour
        604800  ; Expire after 1 week
        86400 ) ; Minimum TTL of 1 day
;
; Name servers
              NS      DNS1.PLAY.GERRY.

;
; MX records
;play.gerry. IN      MX      10 mail.play.gerry.

;
; Aliases

;
; static ips
;
GATEWAY         IN A    192.168.10.1
DNS1            IN A    192.168.10.110
KRB1            IN A    192.168.10.120
AFSDB1          IN A    192.168.10.130
AFSDB2          IN A    192.168.10.131
AFSFS1          IN A    192.168.10.140
AFSFS2          IN A    192.168.10.141
AFSFS3          IN A    192.168.10.142
CLIENT          IN A    192.168.10.99

_kerberos._udp.PLAY.GERRY.     IN SRV 1  0 88  krb1.play.gerry.
_kerberos._tcp.PLAY.GERRY.     IN SRV 1  0 88  krb1.play.gerry.
_kerberos-adm._tcp.PLAY.GERRY. IN SRV 1  0 749 krb1.play.gerry.
_kpasswd._udp.PLAY.GERRY.      IN SRV 1  0 464 krb1.play.gerry.

_afs3-vlserver._udp.PLAY.GERRY. IN SRV 1  0 7003 afsdb1.play.gerry.
_afs3-prserver._udp.PLAY.GERRY. IN SRV 1  0 7003 afsdb1.play.gerry.

``` 

## Set up your Reverse DNS Lookup table

Create `/etc/bind/10-168-192.info`

```
; Origin added to named not ending in a dot
@ IN SOA DNS1.PLAY.GERRY. GERRY.AURISTOR.COM. (
        271     ; Serial
        10800   ; Refresh after 3 hours
        3600    ; Retry after 1 hour
        604800  ; Expire after 1 week
        86400 ) ; Minimum TTL of 1 day
;
; Name servers
                NS      DNS1.PLAY.GERRY.
;
1       IN PTR  GATEWAY.PLAY.GERRY.
120     IN PTR  KRB1.PLAY.GERRY.
130     IN PTR  AFSDB1.PLAY.GERRY.
131     IN PTR  AFSDB2.PLAY.GERRY.
140     IN PTR  AFSFS1.PLAY.GERRY.
141     IN PTR  AFSFS2.PLAY.GERRY.
142     IN PTR  AFSFS3.PLAY.GERRY.
99      IN PTR  CLIENT.PLAY.GERRY.
```

##  Tell Bind where to find Zone Files

Edit `/etc/bind/named.conf.local`

```
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
zone "PLAY.GERRY" {
        type master;
        file "/etc/bind/play.gerry";
};

zone "10.168.192.IN-ADDR.ARPA" {
        type master;
        file "/etc/bind/10-168-192.info";
};
```

## Reboot machine

Then REBOOT machine
	reboot

## After Reboot, start the bind9 service

Then start it with

```
service bind9 start
```


## Links to Sample Files from this Lab

* The following files will have been edited in this lab
	* /etc/network/interfaces
	*  /etc/hostname
	* /etc/bind/10-168-192.info
	* /etc/bind/named.conf.local
	* /etc/bind/play.gerry


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTkyNzEwNzk2OV19
-->