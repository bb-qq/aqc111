# DSM driver for Aquantia AQC111U based USB Ethernet adapters

This is a AQC111U driver package for Synology NASes.

## How to install

1. Go to "Package Center"
2. Press "Manual Install"
3. Chose a driver package downloaded from the [release page](https://github.com/bb-qq/aqc111/releases).

https://www.synology.com/en-us/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

## How to configure

1. [Enable SSH](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and login your NAS
2. Configure IP address for eth2 interface by "synonet" command, which was created by this driver
3. Configure IP address again by Web GUI

Note: IP address configuration will be lost after the device is rebooted. If you find a solution for this issue, please share it.

## Supported NAS platform

* DSM 6.2
* apollolake based products
    * DS918+ (confirmed working)
    * DS620slim
    * DS1019+
    * DS718+
    * DS418play
    * DS218+

If you want to use the driver on other products, please create a issue.

## Supported AQC111U(5.0Gbps) based devices

Currently I only confirmed that a Japanese product "USB-LAN2500R" works. If you got other products and they do not work, please create a issue with its vendor id.

* [QNAP QNA-UC5G1T](https://amzn.to/2A2aI1e) (Type-A)
* [TRENDnet TUC-ET5G](https://amzn.to/314DASp) (Type-C)

## Performance test

### Environment
* DS918+ (QNAP QNA-UC5G1T)
* direct connection with PC (AQN-107)
* [native iperf3](http://www.jadahl.com/iperf-arp-scan/DSM_6.2/)
    * using docker causes high CPU load
* enabled jumbo-frame(9k)

### Result
````
iperf3 -c 192.168.xx.xx -P 2
Connecting to host 192.168.xx.xx, port 5201
[  4] local 192.168.yy.yy port 54613 connected to 192.168.xx.xx port 5201
[  6] local 192.168.yy.yy port 54614 connected to 192.168.xx.xx port 5201
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.00   sec   198 MBytes  1.66 Gbits/sec
[  6]   0.00-1.00   sec   186 MBytes  1.56 Gbits/sec
[SUM]   0.00-1.00   sec   384 MBytes  3.22 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   1.00-2.00   sec   211 MBytes  1.77 Gbits/sec
[  6]   1.00-2.00   sec   189 MBytes  1.58 Gbits/sec
[SUM]   1.00-2.00   sec   400 MBytes  3.36 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   2.00-3.00   sec   209 MBytes  1.75 Gbits/sec
[  6]   2.00-3.00   sec   190 MBytes  1.60 Gbits/sec
[SUM]   2.00-3.00   sec   400 MBytes  3.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   3.00-4.00   sec   209 MBytes  1.76 Gbits/sec
[  6]   3.00-4.00   sec   188 MBytes  1.57 Gbits/sec
[SUM]   3.00-4.00   sec   397 MBytes  3.33 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   4.00-5.00   sec   224 MBytes  1.88 Gbits/sec
[  6]   4.00-5.00   sec   176 MBytes  1.47 Gbits/sec
[SUM]   4.00-5.00   sec   400 MBytes  3.36 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   5.00-6.00   sec   209 MBytes  1.75 Gbits/sec
[  6]   5.00-6.00   sec   191 MBytes  1.60 Gbits/sec
[SUM]   5.00-6.00   sec   400 MBytes  3.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   6.00-7.00   sec   210 MBytes  1.76 Gbits/sec
[  6]   6.00-7.00   sec   189 MBytes  1.59 Gbits/sec
[SUM]   6.00-7.00   sec   399 MBytes  3.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   7.00-8.00   sec   212 MBytes  1.78 Gbits/sec
[  6]   7.00-8.00   sec   186 MBytes  1.56 Gbits/sec
[SUM]   7.00-8.00   sec   398 MBytes  3.34 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   8.00-9.00   sec   212 MBytes  1.78 Gbits/sec
[  6]   8.00-9.00   sec   189 MBytes  1.59 Gbits/sec
[SUM]   8.00-9.00   sec   401 MBytes  3.36 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  4]   9.00-10.00  sec   207 MBytes  1.73 Gbits/sec
[  6]   9.00-10.00  sec   193 MBytes  1.62 Gbits/sec
[SUM]   9.00-10.00  sec   400 MBytes  3.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec  2.05 GBytes  1.76 Gbits/sec                  sender
[  4]   0.00-10.00  sec  2.05 GBytes  1.76 Gbits/sec                  receiver
[  6]   0.00-10.00  sec  1.83 GBytes  1.57 Gbits/sec                  sender
[  6]   0.00-10.00  sec  1.83 GBytes  1.57 Gbits/sec                  receiver
[SUM]   0.00-10.00  sec  3.89 GBytes  3.34 Gbits/sec                  sender
[SUM]   0.00-10.00  sec  3.89 GBytes  3.34 Gbits/sec                  receiver

iperf Done.
````

Also it achieves 434 MB/s for file copy via SMB in this environemnt.
