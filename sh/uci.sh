#!/bin/bash
# Create By NueXini

#FILE=$(cat $GITHUB_WORKSPACE/sh/uci.defaults)

sed -i '/exit 0/d' feeds/x/base-config-setting/files/uci.defaults


cat $GITHUB_WORKSPACE/sh/uci.defaults | while read line
do
    echo $line >> feeds/x/base-config-setting/files/uci.defaults
done



