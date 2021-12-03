#!/bin/bash
# Create By NueXini

FILE=$(cat $GITHUB_WORKSPACE/sh/uci.defaults)

sed -i '$i' feeds/x/base-config-setting/files/uci.defaults
