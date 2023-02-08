
##### 16M修改编译文件 ######
sed -i 's/tplink-4mlzma/tplink-16mlzma/g' target/linux/ath79/image/tiny-tp-link.mk
sed -i 's/<0x020000 0x3d0000>/<0x020000 0xfd0000>/g' target/linux/ath79/dts/tp9343_tplink_tl-wx.dtsi
sed -i 's/<0x3f0000 0x010000>/<0xff0000 0x010000>/g' target/linux/ath79/dts/tp9343_tplink_tl-wx.dtsi
sed -i 's/ucidef_set_interface_wan "eth1";/ucidef_set_interfaces_lan_wan "eth0" "eth1";/g' target/linux/ath79/tiny/base-files/etc/board.d/02_network
rm -rf target/linux/ath79/dts/tp9343_tplink_tl-wr940n-v3.dtsi
svn export https://github.com/fireh1974/biuld-16M-openwrt/trunk/files/tp9343_tplink_tl-wr940n-v3.dtsi target/linux/ath79/dts
#svn co https://github.com/openwrt/packages/trunk/lang/node target/linux/ath79/dts


echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='TL-wr882n'/g" package/base-files/files/bin/config_generate
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
