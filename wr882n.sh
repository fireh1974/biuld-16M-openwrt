
##### 16M修改编译文件 ######
sed -i 's/tplink-4mlzma/tplink-16mlzma/g' target/linux/ath79/image/tiny-tp-link.mk
sed -i 's/<0x020000 0x3d0000>/<0x020000 0xfd0000>/g' target/linux/ath79/dts/tp9343_tplink_tl-wx.dtsi
sed -i 's/<0x3f0000 0x010000>/<0xff0000 0x010000>/g' target/linux/ath79/dts/tp9343_tplink_tl-wx.dtsi
#sed -i 's/ucidef_set_interface_wan "eth1";/ucidef_set_interfaces_lan_wan "eth1.1" "eth0";/g' target/linux/ath79/tiny/base-files/etc/board.d/02_network
sed -i 's/"0@eth0" "1:lan:4" "2:lan:3" "3:lan:2" "4:lan:1"/"0@eth0" "1:lan:1" "2:lan:2" "3:lan:3" "4:lan:4"/g' target/linux/ath79/tiny/base-files/etc/board.d/02_network
#sed -i 's/ucidef_set_led_netdev "wan" "WAN" "blue:wan" "eth1"/ucidef_set_led_netdev "wan" "WAN" "green:wan" "eth0"/g' target/linux/ath79/tiny/base-files/etc/board.d/01_leds
#sed -i 's/" "blue:/" "green:/g' target/linux/ath79/tiny/base-files/etc/board.d/01_leds

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
