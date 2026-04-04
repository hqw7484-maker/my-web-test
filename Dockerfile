FROM alpine:latest

# 安装基础环境
RUN apk add --no-cache nginx curl unzip ca-certificates

WORKDIR /v2ray

# 1. 下载并安装 Xray 核心
RUN curl -L -s https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o xray.zip && \
    unzip xray.zip && chmod +x xray && rm xray.zip

# 2. 准备文件路径
RUN mkdir -p /var/www/html

# 3. 复制本地配置文件到镜像
COPY index.html /var/www/html/index.html
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY config.json ./config.json
COPY entrypoint.sh ./entrypoint.sh

RUN chmod +x entrypoint.sh

# Render 端口占位
EXPOSE 10000

ENTRYPOINT ["./entrypoint.sh"]
