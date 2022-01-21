#!/bin/bash

cd nuexini
../sh/Hello_NueXini.sh
./scripts/feeds update -a && ./scripts/feeds install -a

ls ../config | grep .config | while read conf
do
    cp -rf ../config/$conf ./.config
	../sh/Hi_NueXini.sh
	make defconfig
	make download -j8
	rm -rf $(find ./dl/ -size -1024c)
	make -j8 || make -j1 V=sc >> ./make.log 2>&1
done

time=$(TZ=UTC-8 date "+%H%M")
zip -q -r NueXini-$time.zip ./bin/
../sh/z.cowtransfer.sh
./cowtransfer-uploader -s -p 64 NueXini-$time.zip 2>&1 | tee cowtransfer.log
cp -rf ./bin/ ./nuexini/
echo "::warning file=cowtransfer.com::$(cat cowtransfer.log | grep https)"

# Creatr by NueXini

