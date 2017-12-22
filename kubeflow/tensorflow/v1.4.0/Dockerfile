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
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        rsync \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# installing pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
         numpy \
         Pillow \
         h5py \
         matplotlib \
         pandas \
         scipy \
         sklearn 

RUN pip --no-cache-dir install \
    tensorflow==1.4.0 \
    tensorflow-tensorboard==0.4.0rc3
