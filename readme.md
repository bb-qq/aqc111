# DSM driver for Aquantia AQC111U based USB Ethernet adapters

This is a AQC111U(5Gbps) driver package for Synology NASes.

## Supported NAS platform

* DSM 7.x
* apollolake based products
    * DS918+ (confirmed working)
    * DS620slim
    * DS1019+
    * DS718+
    * DS418play
    * DS218+

You can download drivers including other platforms from the [Release page](https://github.com/bb-qq/aqc111/releases) and determine a proper driver for your model from [this page](https://www.synology.com/en-global/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have), but you might encounter some issues with unconfirmed platforms. If you are using such an unconfirmed models, the [Compatibility page](https://github.com/bb-qq/aqc111/wiki/Compatibility) may be helpful.

I very much appreciate if you report whether it works.

NOTE: I recommend using front ports to connect devices because some users reported stability issues when they use rear ports.

## Supported AQC111U(5.0Gbps) based devices

Currently I only confirmed QNAP QNA-UC5G1T works. If you got other products and they do not work, please create a issue with its vendor id.

* [QNAP QNA-UC5G1T](https://amzn.to/2A2aI1e) (Type-A, confirmed working)
* [TRENDnet TUC-ET5G](https://amzn.to/314DASp) (Type-C)
* [SABRENT NT-SS5G](https://amzn.to/3bi8QI0) (Type-C/Type-A confirmed working by users)
* [StarTech.com US5GA30](https://amzn.to/3pcq90u) (Type-A confirmed working by users)

## How to install

### Preparation

[Enable SSH](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and login your NAS.

### Installation

1. Go to "Package Center"
2. Press "Manual Install"
3. Chose a driver package downloaded from the [release page](https://github.com/bb-qq/aqc111/releases).
4. [DSM7] The installation will fail the first time. After that, run the following command from the SSH terminal:
   `sudo install -m 4755 -o root -D /var/packages/aqc111/target/aqc111/spk_su /opt/sbin/spk_su`
5. [DSM7] Retry installation. (You don't need above DSM7 specific steps at the next time.)

https://www.synology.com/en-us/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

## How to configure

You can configure the IP addresses and MTU of the added NICs from the DSM UI in the same way as the built-in NICs.

### Private flags

This driver support additional options. 

* Disable thermal throttling
    * Link speed is configured to 100Base when the internal chip overheats automatically by default. This option disables that behavior.
    * ``ethtool --set-priv-flags eth2 "Thermal throttling" off``
* Enable Low Power 5G
    * Entering to low heat generation mode at the expense of throughput. This option should be enabled when thermal throttling is disabled.
    * ``ethtool --set-priv-flags eth2 "Low Power 5G" on``

## Performance test

### Environment
* DS918+ (QNAP QNA-UC5G1T)
* direct connection with PC ([AQN-107](https://amzn.to/31arYN8))
* [native iperf3](http://www.jadahl.com/iperf-arp-scan/)
    * using docker causes high CPU load
* enable jumbo-frame(9k)

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
