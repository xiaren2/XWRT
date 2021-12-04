#!/bin/bash

# 设置luci-theme-argon为默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/+luci-theme-bootstrap //g' feeds/luci/collections/luci/Makefile

# 安装UPX
ln -s /usr/bin/upx ./staging_dir/host/bin/upx
ln -s /usr/bin/upx-ucl ./staging_dir/host/bin/upx-ucl

# x-wrt
if [ -d "feeds/x" ]; then
	#curl -s https://raw.githubusercontent.com/NueXini/BuildOpenWrt/master/sh/uci.sh | /bin/bash
	$GITHUB_WORKSPACE/sh/xxx.sh

	cp -f $GITHUB_WORKSPACE/sh/banner package/base-files/files/etc/banner

	cd feeds/NueXini_Packages
	#curl -s https://raw.githubusercontent.com/NueXini/BuildOpenWrt/master/sh/language_fix.sh | /bin/bash
	$GITHUB_WORKSPACE/sh/language_fix.sh
fi

