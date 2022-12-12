#!/bin/bash
ping github.com -c 1
echo "设备正常访问 Github，正在下载配置"
wget -P /root https://github.com/miaoermua/newifi3-nezha/raw/main/down.sh
wget -P /etc/init.d https://github.com/miaoermua/newifi3-nezha/raw/main/nezha-service
wget -P /tmp https://github.com/miaoermua/newifi3-nezha/raw/main/nezha-agent
chmod +x /root/down.sh
chmod +x /etc/init.d/nezha-service
chmod +x /tmp/nezha-agent
echo "部署完毕,为了安全已抹去隐私信息"
vi /etc/init.d/nezha-service