###
 # @Author: miaoermua
 # @Date: 2022-12-12 20:29:26
 # @LastEditors: ttimochan
 # @LastEditTime: 2022-12-12 20:38:07
 # @FilePath: /newifi3-nezha/1.sh
### 
#!/bin/bash
if [ $(id -u) != "0" ]; then
    echo "please use root user run this shell script!"
    exit 1
fi
echo "部署初始环境"
donwload_file(){
    if [ ! -x "$(command -v wget)" ]; then
        echo "wget not found, install wget~"
        opkg update && opkg install wget
    fi

    wget -P /root https://fastly.jsdelivr.net/gh/miaoermua/newifi3-nezha@main/down.sh
   
    if [ ! -f "/root/down.sh" ]; then
        echo "down.sh download failed, please check your network!"
        exit 1
    fi

    wget -P /etc/init.d https://fastly.jsdelivr.net/gh/miaoermua/newifi3-nezha@main/nezha-service
    
    if [ ! -f "/etc/init.d/nezha-service" ]; then
        echo "nezha-service download failed, please check your network!"
        exit 1
    fi

    wget -P /tmp https://fastly.jsdelivr.net/gh/miaoermua/newifi3-nezha@main/nezha-agent
   
    if [ ! -f "/tmp/nezha-agent" ]; then
        echo "nezha-agent download failed, please check your network!"
        exit 1
    fi
}
chmod_script(){
    
    chmod +x /root/down.sh
    
    if [ $? -eq 0 ]; then
        echo "down.sh chmod success!"
    else
        echo "down.sh chmod failed!"
        exit 1
    fi

    chmod +x /etc/init.d/nezha-service

    if [ $? -eq 0 ]; then
        echo "nezha-service service chmod success!"
    else
        echo "nezha-service service chmod failed!"
        exit 1
    fi

    chmod +x /tmp/nezha-agent
   
    if [ $? -eq 0 ]; then
        echo "nezha-agent file chmod success!"
    else
        echo "nezha-agent file chmod failed!"
        exit 1
    fi
}
main(){   
    echo "开始部署"
    donwload_file()
    chmod_script()
    echo "部署完毕"
    vi /etc/init.d/nezha-service
}
main()