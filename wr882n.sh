##### 16M修改编译文件 ######
sed -i 's/<0x020000 0x7d0000>/<0x020000 0xfd0000>/g' target/linux/ath79/dts/ar9344_tplink_tl-wdrxxxx.dtsi
sed -i 's/<0x7f0000 0x010000>/<0xff0000 0x010000>/g' target/linux/ath79/dts/ar9344_tplink_tl-wdrxxxx.dtsi
sed -i 's/tplink-8mlzma/tplink-16mlzma/g' target/linux/ath79/image/generic-tp-link.mk

echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='fireh-WDR3200'/g" package/base-files/files/bin/config_generate
echo '=========Alert hostname OK!========='
