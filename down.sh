###
 # @Author: miaoermua
 # @Date: 2022-12-12 19:42:03
 # @LastEditors: ttimochan
 # @LastEditTime: 2022-12-12 20:25:52
 # @FilePath: /newifi3-nezha/down.sh
### 
#!/bin/bash

# check root user
if [ $(id -u) != "0" ]; then
    echo "please use root user run this shell script!"
    exit 1
fi
# check wifi module
start_wifi(){

    /sbin/mtkwifi up
}
# check nezha-agent
download_nezha(){
    if [ ! -x "$(command -v wget)" ]; then
        echo "wget not found, install wget~"
        opkg update && opkg install wget
    fi
    
    wget -P /tmp  https://fastly.jsdelivr.net/gh/miaoermua/newifi3-nezha@main/nezha-agent

    if [ ! -f "/tmp/nezha-agent" ]; then
        echo "nezha-agent download failed, please check your network!"
        exit 1
    fi
}
# check nezha-agent
chmod_nezha(){

    chmod +x /tmp/nezha-agent
}
# enable nezha-agent
start_nezha(){
    /etc/init.d/nezha-service enable && \
    /etc/init.d/nezha-service start 
    if [ $? -eq 0 ]; then
        echo "nezha-agent start success!"
    else
        echo "nezha-agent start failed!"
        exit 1
    fi
}
# main function
main(){
    echo "start wifi module..."
    start_wifi()
    sleep 1
    echo "download nezha-agent..."
    download_nezha()
    sleep 1
    echo "chmod nezha-agent..."
    chmod_nezha()
    sleep 1
    echo "start nezha-agent..."
    start_nezha()
    sleep 2
    echo "Enjoy it!"
}
main()