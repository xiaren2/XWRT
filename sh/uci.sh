#!/bin/bash
# Create By NueXini

FILE=$(cat $GITHUB_WORKSPACE/sh/uci.defaults)

sed -e -i "$i \\$FILE" feeds/x/base-config-setting/files/uci.defaults
