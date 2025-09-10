FROM ubuntu:22.04

WORKDIR /app
RUN apt-get update && apt-get install -y wget unzip

# 下载并解压 Gophish
RUN wget -q https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip \
    && unzip gophish-v0.12.1-linux-64bit.zip \
    && mv gophish-v0.12.1-linux-64bit/* . \
    && rm -rf gophish-v0.12.1-linux-64bit gophish-v0.12.1-linux-64bit.zip \
    && chmod +x gophish

# 复制自定义配置文件
COPY config.json /app/config.json

# 暴露两个端口
EXPOSE 8080
EXPOSE 3333

# 启动 Gophish
CMD ["./gophish"]
