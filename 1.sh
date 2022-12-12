#!/bin/bash
echo "部署初始环境"
wget -P /root https://github.com/miaoermua/newifi3-nezha/raw/main/down.sh
wget -P /etc/init.d https://github.com/miaoermua/newifi3-nezha/raw/main/nezha-service
wget -P /tmp https://github.com/miaoermua/newifi3-nezha/raw/main/nezha-agent
chmod +x /root/down.sh
chmod +x /etc/init.d/nezha-service
chmod +x /tmp/nezha-agent
echo "部署完毕"
vi /etc/init.d/nezha-service