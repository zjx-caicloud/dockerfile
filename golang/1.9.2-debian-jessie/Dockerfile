FROM debian:jessie

# Set the default timezone to Shanghai
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Use aliyun source
RUN echo "deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib" > /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib" >>  /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  make \
  bash && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD go1.9.2.linux-amd64.tar.gz /usr/local

ENV GOROOT=/usr/local/go 
ENV GOPATH=$HOME/  
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH
