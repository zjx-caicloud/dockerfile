FROM docker:1.11.2

# Use aliyun source
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/community" >> /etc/apk/repositories

RUN apk add --no-cache make git subversion ca-certificates tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
