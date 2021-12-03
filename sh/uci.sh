#!/bin/bash
# Create By NueXini

FILE=$(cat $GITHUB_WORKSPACE/sh/uci.defaults)

sed -i "$i\\$FILE" feeds/x/base-config-setting/files/uci.defaults
