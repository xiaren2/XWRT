
# 设置luci-theme-argon为默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/+luci-theme-bootstrap //g' feeds/luci/collections/luci/Makefile

# 安装UPX
ln -s /usr/bin/upx ./staging_dir/host/bin/upx
ln -s /usr/bin/upx-ucl ./staging_dir/host/bin/upx-ucl

# 
# rm -rf feeds/NueXini_Packages/luci-app-turboacc
# rm -rf feeds/NueXini_Packages/shortcut-fe
