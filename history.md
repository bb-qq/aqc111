## 1.3.3.0
_Date 2019.07.02_
* Fix for Linux Low 5G RX performance (FIJI-310)

## 1.3.2.0
_Date 2019.04.05_
* Fix: rx checksum offload was disabled by default (FIJI-292)

## 1.3.1.0
_Date 2019.03.05_
* Add HWIDs for QNAP (FIJI-269)

## 1.3.0.0
_Date 2019.01.11_
* Implement Thermal throttling configure via FW interface (FIJI-238)

## 1.2.4.0
_Date 2018.12.17_
* Add configure Thermal Throttling feature via priv flags(FIJI-219)

## 1.2.3.0
_Date 2018.12.11_
* Add HWID for TRENDnet

## 1.2.2.0
_Date 2018.11.23_
* fix for setting MTU on CentOs 7.2 (FIJI-209).

## 1.2.1.0
_Date 2018.11.22_
+ Switch FW mode to LAN+CDC (FIJI-206).
* sync changes after upstream review.
    * fix for MTU: use same value everywhere (was different).
    + match to ECM configuration.
    * use linkmode_copy instead of bitmap_copy.
 
## 1.2.0.0
_Date 2018.10.31_
+ add possibility to enable/disable XFI/2 (FIJI-146).
* fix `su` in makefile (FIJI-148).
* fix for setting MTU (FIJI-152).
* fix build for all main kernels (same as for atlantic) (FIJI-153).
* sync changes after upstream review.
    * rewrite read/write functions.
    * use driver_priv field to store context.
    * check duplex setting in set_link_ksettings(`ethtool -s` option)
    - remove CDC configuration blacklisting.
    + add compiance for BE (all bitfield are repleced with mask and shifts)

## 1.1.0.0
_Date 2018.10.11_
+ thermal throttling feature (FIJI-125).
+ add ASIX's HWIDs (FIJI-132).

## 1.0.0.0
_Date 2018.10.03_
* fix for trying to set WOL type other than MAGIC_PACKET. It should return Invalid parameter.
+ fill vlan_features: it enables csum, SG, TSO offloads for virtual VLAN interfaces.
* rename TX/RX descriptors structures.

## 0.9.0.0
_Date 2018.09.25_
+ support for new interface for PHY and WOL configuration(FIJI-102).
* Most of HW initialization is moved to link up event.
+ support of enable\disable RX checksum offload via ethtool(FIJI-90).
* read FW version on B0 chip (FIJI-59).
* fix inability to disable WOL via ethtool (FIJI-103).

## 0.8.0.0
_Date 2018.08.31_
* read FW version on bind(FIJI-59).
+ add support of new ethttool callbacks get/set_ksettings (FIJI-74).
* process setting of autoneg and speed via ethtool correctly (FIJI-76).
* fixed a lot of warnings of the latest checkpatch.
+ change all prefixes from aqc101 to aqc111. Also module name was changed.
* unify values names.
* using "Aquantia AQtion USB to 5GbE Controller" as a driver name and driver description.
* update copyrights: return original strings.

## 0.7.0.0
_Date 2018.08.03_
* cleanup value names.
+ show FW version as 3 numbers.
* update copirights.
- remove MII support.
- remove unnecessary function for ethtool (get_len and read eeprom).
* cleanup descriptor structures.
- remove unnecessary msg_enable value(is not used).
* fix: advertising via ethtool(100Mbit was advertised everytime).
* cleanup rx_fixup(skb reasseble).

## 0.6.0.0:
_Date 2018.07.27_
+ move to versioning with four numbers.
- remove 10G from ethtool interface method get_setting.
+ show correct driver version, driver name, FW version.
+ reduce speed to 1Gbit in case device is connected via USB2.0 interface.
+ switch to 100Mbit when go to sleep state.
* change LED's scheme: LED is on when link up and blinks when data goes over.
- remove WAKE_PHY as wake option.

## 0.5.0:
_Date 2018.07.17_
+ put PHY to low power mode on stop/suspend (if no need to keep link) instead of Power down.
- remove 10G from ethtool settings and advertising since it is not supported.
+ advertise 100Mbit/s (was not advertised).
* fix broken data path after suspend/resume.
* fix set multicas list and other filters.
- remove unnecessary exports.
* optimize parts of code (made it smaller).
* optimize processing link up/down.
+ control by LED's.
 
## 0.4.0:
_Date 2018.07.03_
* fix build for CentOS7.
* fixed build for kernels less than 4.12.x.
* clean sources.

## Help:
```bash
modprobe usbnet
insmod aqc111.ko
```