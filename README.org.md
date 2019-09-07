# Linux USB driver

## Build from sources:
* Unpack sources to temporary folder (e.g `tar -xf pacific.tar.gz`).
  It will create Linux/ directory 
* Change directory (`cd Linux`)
* Perform `make` 

## Load driver:
* `modprobe usbnet`
* `insmod aqc111.ko`

## Unload driver:
* `rmmod aqc111`

## Install driver:
Note: starting from 5.x kernel, driver is built in. Be aware to corrupt original file.
* `cp aqc111.ko /lib/modules/$(uname -r)/kernel/drivers/net/usb/`
* `depmod -a`

## Uninstall driver:
Note: starting from 5.x kernel, driver is built in. Be aware to corrupt original file.
* `rm /lib/modules/$(uname -r)/kernel/drivers/net/usb/aqc111.ko`
* `depmod -a`

## Private flags reference:
### Query supported flags:
```bash
ethtool --show-priv-flags <interface>
```

### Currently supported flags:

| Flag | Default value |
| -----| ------------- |
| Low Power 5G | off |
| Thermal throttling | on |

### Change flag:

**Enable:**
```bash
ethtool --set-priv-flags <interface> "<flag>" on
```

**Disable:**
```bash
ethtool --set-priv-flags <interface> "<flag>" off
```

**E.g**
```bash
ethtool --set-priv-flags enx0017b6123456 "Low Power 5G" on
```