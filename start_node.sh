#!/bin/sh

# 自动捕获 Render 分配的端口
LISTEN_PORT=${PORT:-10000}
sed -i "s/SCIENTIFIC_PORT/${LISTEN_PORT}/g" /etc/nginx/http.d/default.conf

echo "🧪 Laboratory Server Initializing..."
echo "🌐 Node Status: ONLINE on Port $LISTEN_PORT"

# 后台启动 Nginx 演示页面
nginx

# 启动运算核心 (读取伪装配置文件)
./node-engine run -config ./model_params.db
