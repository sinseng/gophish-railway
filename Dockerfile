FROM ubuntu:22.04

WORKDIR /app
RUN apt-get update && apt-get install -y wget unzip

# 下载并解压 Gophish
RUN wget -q https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip \
    && unzip gophish-v0.12.1-linux-64bit.zip \
    && mv gophish/* . \
    && rm -rf gophish gophish-v0.12.1-linux-64bit.zip

# 复制你的配置文件（必须小写 config.json）
COPY config.json /app/config.json

EXPOSE 8080
CMD ["./gophish"]
