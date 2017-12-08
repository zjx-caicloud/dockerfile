FROM docker:17.11-dind

# Use aliyun source
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/community" >> /etc/apk/repositories

ADD kubectl /usr/bin/

RUN apk add --no-cache \
            make \
            bash \
            git
