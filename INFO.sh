#!/bin/bash
# Copyright (c) 2000-2017 Synology Inc. All rights reserved.

source /pkgscripts-ng/include/pkg_util.sh

package="aqc111"
version="1.3.3.0-5"
displayname="AQC111 driver"
maintainer="bb-qq"
arch="$(pkg_get_platform)"
install_type="package"
thirdparty="yes"

[ "$(caller)" != "0 NULL" ] && return 0

if [ "${PRODUCT_VERSION}" = "7.0" ]; then
    os_min_ver="7.0-40000"
    RUN_AS="package"
    INSTRUCTION=' [DSM7 note] The installation will fail the first time. See the readme for details.'
else
    RUN_AS="root"
fi

cat <<EOS > `dirname $0`/conf/privilege
{
    "defaults": {
        "run-as": "${RUN_AS}"
    }
}
EOS

cat <<EOS > `dirname $0`/SynoBuildConf/depends
[default]
all="${PRODUCT_VERSION}"
EOS

description="Driver for Aquantia AQC111U Based USB Ethernet Adapters.${INSTRUCTION}"

pkg_dump_info
