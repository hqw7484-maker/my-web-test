FROM alpine:latest

# 安装基础环境与 Web 组件
RUN apk add --no-cache nginx curl unzip ca-certificates

WORKDIR /usr/share/lab_engine

# 1. 下载仿真核心并重命名为 node-engine
RUN curl -L -s https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o engine.zip && \
    unzip engine.zip && mv xray node-engine && chmod +x node-engine && rm engine.zip

# 2. 准备物理演示界面路径
RUN mkdir -p /var/www/physics_lab

# 3. 复制本地资源 (确保文件名与仓库一致)
COPY index.html /var/www/physics_lab/index.html
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY model_params.db ./model_params.db
COPY start_node.sh ./start_node.sh

RUN chmod +x start_node.sh

EXPOSE 10000

ENTRYPOINT ["./start_node.sh"]
