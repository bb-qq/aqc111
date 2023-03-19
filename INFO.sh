#!/bin/bash
# Copyright (c) 2000-2017 Synology Inc. All rights reserved.

source /pkgscripts-ng/include/pkg_util.sh

package="aqc111"
version="1.3.3.0-11"
displayname="AQC111 driver"
maintainer="bb-qq"
arch="$(pkg_get_platform)"
install_type="package"
thirdparty="yes"

[ "$(caller)" != "0 NULL" ] && return 0

PRODUCT_VERSION_WITHOUT_MICRO=`echo ${PRODUCT_VERSION} | sed -E 's/^([0-9]+\.[0-9]+).+$/\1/'`
if [ 1 -eq $(echo "${PRODUCT_VERSION_WITHOUT_MICRO} >= 7.0" | bc) ]; then
    os_min_ver="7.0-40000"
    RUN_AS="package"
    INSTRUCTION=' [DSM7 note] If this is the first time you are installing this driver, special steps are required. See the readme for details.'
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
