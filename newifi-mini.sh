####### Modify the version number
sed -i "s/OpenWrt /fireh build from Lede $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='Newifi-mini'/g" package/base-files/files/bin/config_generate
echo '=========Alert hostname OK!========='

echo '移除主页跑分信息显示'
sed -i 's/ <%=luci.sys.exec("cat \/etc\/bench.log") or ""%>//g' package/lean/autocore/files/arm/index.htm
echo '=========Remove benchmark display in index OK!========='

# Modify default IP 
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

##### Set argon as default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile