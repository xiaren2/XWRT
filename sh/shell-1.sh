#!/bin/bash

# 替换dl mirror
sed -i 's#mirror2.openwrt.org/sources#github.com/NueXini/Update_NueXini_Packages/raw/master/other#g' scripts/download.pl

# 添加插件源
sed -i '$a src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default

# 设置路由器IP地址为192.168.3.1
sed -i 's/192.168.1.*.1/192.168.3.1/g' package/base-files/files/bin/config_generate

# NTP服务器
sed -i 's,0.openwrt.pool.ntp.org,time1.cloud.tencent.com,g' package/base-files/files/bin/config_generate
sed -i 's,1.openwrt.pool.ntp.org,ntp1.aliyun.com,g' package/base-files/files/bin/config_generate
sed -i 's,2.openwrt.pool.ntp.org,ntp.ntsc.ac.cn,g' package/base-files/files/bin/config_generate
sed -i 's,3.openwrt.pool.ntp.org,cn.ntp.org.cn,g' package/base-files/files/bin/config_generate



# lean默认设置
if [ -f "package/lean/default-settings/files/zzz-default-settings" ]; then
	sed -i "s#'OpenWrt#&/NueXini#g" package/lean/default-settings/files/zzz-default-settings
elif [ -f "package/default-settings/files/zzz-default-settings" ]; then
	sed -i "s#'OpenWrt#&/NueXini#g" package/default-settings/files/zzz-default-settings
else
	sed -i 's/%R/NueXini/g' package/base-files/files/etc/openwrt_release
fi
###

# 删除lean libcryptopp
if [ -d "package/lean/libcryptopp" ]; then
	rm -rf package/lean/libcryptopp
fi
###

