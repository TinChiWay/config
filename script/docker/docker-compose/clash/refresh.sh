wget -O /root/project/config/script/docker/docker-compose/clash/config/clash_config.yaml https://sub.xeton.dev/sub\?target\=clash\&url\=https%3A%2F%2Fs.sublink.me%2Fsubscribe%2F3153%2FeBwMG7Nj2Ex%2Fssr%2F > logs.log
sed -i 's/127.0.0.1:9090/0.0.0.0:9090/g' /root/project/config/script/docker/docker-compose/clash/config/clash_config.yaml
