echo -e "export http_proxy=http://127.0.0.1:7890\nexport https_proxy=http://127.0.0.1:7890\nexport no_proxy=127.0.0.1,localhost" > /etc/profile.d/clash.sh
echo -e "系统代理http_proxy/https_proxy/no_proxy设置成功，请在当前窗口执行以下命令加载环境变量:\n\nsource /etc/profile.d/clash.sh\n"
# 测试代理 
# curl www.baidu.com -vL -x http_proxy=http://localhost:7890/
