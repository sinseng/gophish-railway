FROM ubuntu:22.04

WORKDIR /app
RUN apt-get update && apt-get install -y wget unzip

# 下载 Gophish
RUN wget https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip \
    && unzip gophish-v0.12.1-linux-64bit.zip \
    && mv gophish/* .

EXPOSE 8080
CMD ["./gophish"]
