#!/bin/bash

#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/+luci-theme-bootstrap //g' feeds/luci/collections/luci/Makefile

sed -i 's/192.168.1.*.1/192.168.3.1/g' feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system/flash.js

sed -i '/luciversion/d' feeds/luci/modules/luci-base/src/mkversion.sh
sed -i '/luciname/aluciversion= NueXini' feeds/luci/modules/luci-base/src/mkversion.sh


ln -s /usr/bin/upx ./staging_dir/host/bin/upx
ln -s /usr/bin/upx-ucl ./staging_dir/host/bin/upx-ucl

if [ -d "feeds/x" ]; then
	$GITHUB_WORKSPACE/sh/x.sh
fi

