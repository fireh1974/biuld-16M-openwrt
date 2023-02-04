echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

##### wdr4300-16M修改编译文件 ######
sed -i 's/<0x020000 0x7d0000>/<0x020000 0xfd0000>/g' target/linux/ath79/dts/ar9344_tplink_tl-wdrxxxx.dtsi
sed -i 's/<0x7f0000 0x010000>/<0xff0000 0x010000>/g' target/linux/ath79/dts/ar9344_tplink_tl-wdrxxxx.dtsi
sed -i 's/tplink-8mlzma/tplink-16mlzma/g' target/linux/ath79/image/generic-tp-link.mk

####### Modify the version number
sed -i "s/OpenWrt /fireh build from Lede $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='fireh-WDR3200'/g" package/base-files/files/bin/config_generate
echo '=========Alert hostname OK!========='

echo '移除主页跑分信息显示'
sed -i 's/ <%=luci.sys.exec("cat \/etc\/bench.log") or ""%>//g' package/lean/autocore/files/arm/index.htm
echo '=========Remove benchmark display in index OK!========='

# Modify default IP 
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

##### Set argon as default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile

# 移除不用软件包
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-pptp-server
rm -rf feeds/packages/net/smartdns
rm -rf feeds/packages/utils/syncthing
rm -rf feeds/packages/net/amule
