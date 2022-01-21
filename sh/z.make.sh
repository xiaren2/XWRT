#!/bin/bash

cd nuexini
../sh/Hello_NueXini.sh
./scripts/feeds update -a && ./scripts/feeds install -a
[ -e ../config/${{ matrix.config }} ] && cp -rf ../config/${{ matrix.config }} ./.config
../sh/Hi_NueXini.sh
make defconfig
make download -j8
rm -rf $(find ./dl/ -size -1024c)
make -j8 || make -j1 V=sc >> ./nuexini/make.log 2>&1
time=$(TZ=UTC-8 date "+%H%M")
zip -q -r Bin-NueXini-$time.zip ./bin/
./sh/z.cowtransfer.sh
./cowtransfer-uploader -s -p 64 Bin-NueXini.zip 2>&1 | tee cowtransfer.log
cp -rf Bin-NueXini-$time.zip ./nuexini/
echo "::warning file=cowtransfer.com::$(cat cowtransfer.log | grep https)"


# Creatr by NueXini

