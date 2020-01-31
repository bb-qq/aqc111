#!/bin/bash
# Copyright (c) 2000-2017 Synology Inc. All rights reserved.

source /pkgscripts-ng/include/pkg_util.sh

package="aqc111"
version="1.3.3.0-2"
displayname="AQC111 driver"
maintainer="bb-qq"
arch="$(pkg_get_platform)"
description="Driver for Aquantia AQC111U Based USB Ethernet Adapters."
[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
