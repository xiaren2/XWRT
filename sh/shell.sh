
# 添加插件源
sed -i '$a src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default

# 设置路由器IP地址为192.168.3.1
sed -i 's/192.168.1.*.1/192.168.3.1/g' package/base-files/files/bin/config_generate

# 设置luci-theme-argon为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile


if [ ! -f "package/lean/default-settings/files/zzz-default-settings" ]; then
	sed -i 's#%D#&/NueXini#g' package/base-files/files/etc/openwrt_release
else
	sed -i "s#'OpenWrt#&/NueXini#g" package/lean/default-settings/files/zzz-default-settings
fi

