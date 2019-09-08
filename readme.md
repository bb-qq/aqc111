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

__Warning: This driver is not confirmed actually working yet.__
