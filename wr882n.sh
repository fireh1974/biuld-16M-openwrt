##### 16M修改编译文件 ######

sed -i 's/tplink-2mlzma/tplink-16mlzma/g' target/linux/ar71xx/image/tiny-tp-link.mk

echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='fireh-wr882n'/g" package/base-files/files/bin/config_generate
echo '=========Alert hostname OK!========='
