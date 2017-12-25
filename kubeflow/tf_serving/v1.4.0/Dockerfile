FROM ubuntu:16.04


# some basic dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    pkg-config \
    python \
    python-dev \
    python3 \
    python3-dev \
    software-properties-common \
    zip \
    unzip \
    apt-utils \
    libcurl3-dev \
    libfreetype6-dev \
    libpng12-dev \ 
    libzmq3-dev \ 
    swig \ 
    zlib1g-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# installing pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install numpy

RUN echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" |  tee /etc/apt/sources.list.d/tensorflow-serving.list && \
    curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg |  apt-key add -

RUN apt-get update && apt-get install -y --no-install-recommends tensorflow-model-server=1.4.0 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*