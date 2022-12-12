#!/bin/bash
echo "设备自启成功，正在开启无线"
/sbin/mtkwifi up
echo "下载哪吒探针到 /tmp 并开启服务"
wget -P /tmp https://github.com/miaoermua/newifi3-nezha/raw/main/nezha-agent
chmod +x /tmp/nezha-agent
/etc/init.d/nezha-service enable && /etc/init.d/nezha-service start
echo "Enjoy~"