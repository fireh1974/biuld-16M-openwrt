echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

####### Modify the version number
sed -i "s/OpenWrt /fireh build from Lede $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

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
