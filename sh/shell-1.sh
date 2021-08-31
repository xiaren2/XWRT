
# 添加插件源
sed -i '$a src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default


# 删除lean libcryptopp
if [ -d "package/lean/libcryptopp" ]; then
	rm -rf package/lean/libcryptopp
fi

