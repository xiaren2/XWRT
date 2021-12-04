#!/bin/bash
# Create By NueXini

# 设置系统语言为简体中文
sed -i "s#luci.main.lang='auto'#luci.main.lang='zh_cn'#g" feeds/x/base-config-setting/files/uci.defaults

#默认开启SSH
sed -i "s#PasswordAuth='off'#PasswordAuth='on'#g" feeds/x/base-config-setting/files/uci.defaults
sed -i "s#RootPasswordAuth='off'#RootPasswordAuth='on'#g" feeds/x/base-config-setting/files/uci.defaults

# Other
sed -i '/exit 0/d' feeds/x/base-config-setting/files/uci.defaults

cat $GITHUB_WORKSPACE/sh/uci.defaults | while read line
do
    echo $line >> feeds/x/base-config-setting/files/uci.defaults
done



