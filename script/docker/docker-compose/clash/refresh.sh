wget -O /root/project/config/script/docker/docker-compose/clash/config/clash_config.yaml https://browser.networkwebmail.com/link/Yqaj9qDkWuwfCgQ7?clash=1 > logs.log
sed -i 's/127.0.0.1:9090/0.0.0.0:9090/g' /root/project/config/script/docker/docker-compose/clash/config/clash_config.yaml
