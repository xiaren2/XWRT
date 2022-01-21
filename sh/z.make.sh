#!/bin/bash

# CONFIG_TARGET_ramips_mt7621=y
# CONFIG_TARGET_ipq806x_generic=y
# CONFIG_TARGET_ath79_generic=y
# CONFIG_TARGET_bcm53xx_generic=y
# CONFIG_TARGET_rockchip_armv8=y
# CONFIG_TARGET_mvebu_cortexa53=y
# CONFIG_TARGET_mvebu_cortexa9=y
# CONFIG_TARGET_sunxi_cortexa7=y
# CONFIG_TARGET_x86_64_DEVICE_generic=y

cat << EOF > arch.cfg
CONFIG_TARGET_ramips_mt7621=y
EOF

cat << EOF > app.cfg
feeds/NueXini_Packages/luci-app-passwall
EOF

releasetag=$(cat ./config/releasetag.list | awk 'NR==1')
git clone $releasetag nuexini

cd nuexini
../sh/Hello_NueXini.sh
./scripts/feeds update -a
./scripts/feeds install -a
cp -rf ../arch.cfg ./.config
../sh/Hi_NueXini.sh

cat ../app.cfg | while read app
do
	make $app/compile V=s >> ./bin/make.log 2>&1
done


# Creatr by NueXini

