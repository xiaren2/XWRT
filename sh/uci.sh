#!/bin/bash
# Create By NueXini

FILE=$(cat $GITHUB_WORKSPACE/sh/uci.defaults)

sed -i '/exit 0/d' feeds/x/base-config-setting/files/uci.defaults
echo "\$FILE" >> feeds/x/base-config-setting/files/uci.defaults
