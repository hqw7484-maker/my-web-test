#!/bin/sh

# 动态适配 Render 端口
PORT=${PORT:-10000}
sed -i "s/RENDER_PORT/${PORT}/g" /etc/nginx/http.d/default.conf

echo "🌐 System starting on port: $PORT"

# 后台启动 Nginx
nginx

# 启动 Xray
echo "🚀 Xray core is running..."
./xray run -config ./config.json
