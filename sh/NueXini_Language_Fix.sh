#!/bin/bash
# Create By NueXini

cd feeds/NueXini_Packages
PATH_1="$({ find -type d|grep "zh-cn"; } 2>"/dev/null")"
PATH_2="$({ dirname $PATH_1; } 2>"/dev/null")"


for a in ${PATH_1}
do
    ln -s ${PATH_1} ${PATH_1}/zh_Hans
done
