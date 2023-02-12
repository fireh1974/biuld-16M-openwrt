
##### 16M修改编译文件 ######
sed -i 's/tplink-4m/tplink-16m/g' target/linux/ath79/image/tiny-tp-link.mk
sed -i 's/<0x20000 0x3d0000>/<0x020000 0xfd0000>/g' target/linux/ath79/dts/ar7240_tplink.dtsi
sed -i 's/<0x3f0000 0x10000>/<0xff0000 0x010000>/g' target/linux/ath79/dts/ar7240_tplink.dtsi
rm -rf target/linux/ath79/image/common-tp-link.mk
svn export https://github.com/fireh1974/biuld-16M-openwrt/trunk/files/common-tp-link.mk target/linux/ath79/image
# common-tp-link.mk 文件添加16m设置
echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname=WR841n v5'/g" package/base-files/files/bin/config_generate
echo '=========Alert hostname OK!========='

##### Set argon as default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile


####### Modify the version number
sed -i "s/OpenWrt /fireh build from Lede $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings


# Modify default IP 
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 移除不用软件包
# rm -rf feeds/luci/applications/luci-app-netdata
# rm -rf feeds/luci/applications/luci-app-pptp-server
# rm -rf feeds/packages/net/smartdns
# rm -rf feeds/packages/utils/syncthing
# rm -rf feeds/packages/net/amule
