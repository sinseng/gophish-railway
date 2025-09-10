FROM ubuntu:22.04

WORKDIR /app
RUN apt-get update && apt-get install -y wget unzip

# 下载并解压 Gophish 到 /app
RUN wget -q https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip \
    && unzip gophish-v0.12.1-linux-64bit.zip -d /app \
    && rm -f gophish-v0.12.1-linux-64bit.zip \
    && chmod +x /app/gophish

# 复制配置文件
COPY config.json /app/config.json

# 开放端口
EXPOSE 8080
EXPOSE 3333

# 启动 gophish
CMD ["./gophish"]
