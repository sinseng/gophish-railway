FROM ubuntu:22.04

WORKDIR /app
RUN apt-get update && apt-get install -y wget unzip

# 下载并解压 Gophish
RUN wget https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip \
    && unzip gophish-v0.12.1-linux-64bit.zip -d /app \
    && rm gophish-v0.12.1-linux-64bit.zip \
    && chmod +x /app/gophish

# 复制配置文件（必须小写 config.json）
COPY config.json /app/config.json

EXPOSE 8080
CMD ["./gophish"]
