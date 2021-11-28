
# 设置luci-theme-argon为默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/+luci-theme-bootstrap //g' feeds/luci/collections/luci/Makefile

# 安装UPX
ln -s /usr/bin/upx ./staging_dir/host/bin/upx
ln -s /usr/bin/upx-ucl ./staging_dir/host/bin/upx-ucl

# 
rm -rf feeds/NueXini_Packages/luci-app-turboacc
rm -rf feeds/NueXini_Packages/shortcut-fe

# x-wrt
if [ -d "feeds/x" ]; then
	sed -i "s#luci.main.lang='auto'#luci.main.lang='zh_cn'#g" feeds/x/base-config-setting/files/uci.defaults
	sed -i 's/-hidden//g' feeds/luci/applications/luci-app-opkg/root/usr/share/luci/menu.d/luci-app-opkg.json
	sed -i 's#downloads.openwrt.org#mirrors.cloud.tencent.com/openwrt#g' include/version.mk
fi
