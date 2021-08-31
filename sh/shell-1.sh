
# 添加插件源
sed -i '$a src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default

# 设置路由器IP地址为192.168.3.1
sed -i 's/192.168.1.*.1/192.168.3.1/g' package/base-files/files/bin/config_generate

# lean默认设置
if [ -f "package/lean/default-settings/files/zzz-default-settings" ]; then
	sed -i "s#'OpenWrt#&/NueXini#g" package/lean/default-settings/files/zzz-default-settings
elif [ -f "package/lean/default-settings/files/zzz-default-settings" ]; then
	sed -i "s#'OpenWrt#&/NueXini#g" package/default-settings/files/zzz-default-settings
else
	sed -i 's#%D#&/NueXini#g' package/base-files/files/etc/openwrt_release
	sed -i 's#downloads.openwrt.org#mirrors.cloud.tencent.com/openwrt#g' /etc/opkg/distfeeds.conf
fi
###

# 删除lean libcryptopp
if [ -d "package/lean/libcryptopp" ]; then
	rm -rf package/lean/libcryptopp
fi
###

