FROM ubuntu:16.04
MAINTAINER Hao Jiang (hao.jiang@corerain.com)
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    python3 \
    python3-dev \
    python3-pip \
    virtualenv \
    libssl-dev \
    libpq-dev \
    git \
    build-essential \
    cmake \
    vim \
    zip \
    unzip \
    libtool \
    libgtest-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    autoconf \
    automake \
    libtool \
    curl \
    wget

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update -y \
    && apt-get install -y \
    gcc-7 \
    g++-7
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10

# House cleanning
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/* \
           /usr/share/doc/*

# Create packages folder /workspace/tmp
RUN mkdir -p /workspace/tmp

# Install OpenCV for C and C++
RUN cd /workspace/tmp/ \
    && wget -O opencv-3.4.zip \
    https://codeload.github.com/opencv/opencv/zip/3.4 \
    && unzip opencv-3.4.zip \
    && cd opencv-3.4 \
    && mkdir -p build \
    && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=release \
                -DCMAKE_INSTALL_PREFIX=/usr/local/ \
    && make -j3 \
    && make install \
    && ldconfig

# House cleanning
RUN rm -rf /workspace/tmp/opencv-3.4.zip
RUN rm -rf /workspace/tmp/opencv-3.4

# Install protobuf
RUN cd /workspace/tmp/ \
    && wget -O protobuf-3.5.1.1.zip \
    https://codeload.github.com/protocolbuffers/protobuf/zip/3.5.1.1 \
    && unzip protobuf-3.5.1.1.zip \
    && cd protobuf-3.5.1.1 \
    && ./autogen.sh \
    && ./configure \
    && make -j3 \
    && make check \
    && make install \
    && ldconfig

# House cleanning
RUN rm -rf /workspace/tmp/protobuf-3.5.1.1.zip
RUN rm -rf /workspace/tmp/protobuf-3.5.1.1

# Install gflags
RUN cd /workspace/tmp/ \
    && wget -O gflags-2.2.2.zip \
    https://codeload.github.com/gflags/gflags/zip/v2.2.2 \
    && unzip gflags-2.2.2.zip \
    && cd gflags-2.2.2 \
    && mkdir -p build \
    && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=release \
                -DCMAKE_INSTALL_PREFIX=/usr/local/ \
                -DBUILD_SHARED_LIBS=true \
                -DBUILD_STATIC_LIBS=true \
    && make -j3 \
    && make install \
    && ldconfig

# House cleanning
RUN rm -rf /workspace/tmp/gflags-2.2.2.zip
RUN rm -rf /workspace/tmp/gflags-2.2.2

# Install eigen
RUN cd /workspace/tmp/ \
    && wget -O eigen-eigen-b3f3d4950030.tar.bz2 \
    https://bitbucket.org/eigen/eigen/get/3.3.5.tar.bz2 \
    && tar -xvf eigen-eigen-b3f3d4950030.tar.bz2 \
    && cd eigen-eigen-b3f3d4950030 \
    && mkdir -p build \
    && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=release \
                -DCMAKE_INSTALL_PREFIX=/usr/local/ \
    && make -j3 \
    && make install \
    && ldconfig

# House cleanning
RUN rm -rf /workspace/tmp/eigen-eigen-b3f3d4950030.tar.bz2
RUN rm -rf /workspace/tmp/eigen-eigen-b3f3d4950030

# Install glog
RUN cd /workspace/tmp/ \
    && wget -O glog-0.3.3.zip \
    https://codeload.github.com/google/glog/zip/v0.3.3 \
    && unzip glog-0.3.3.zip \
    && cd glog-0.3.3 \
    && ./configure \
    && make -j3 \
    && make install \
    && ldconfig

# House cleanning
RUN rm -rf /workspace/tmp/glog-0.3.3.zip
RUN rm -rf /workspace/tmp/glog-0.3.3

# Pip install
RUN pip install "opencv-python"
RUN pip install "setuptools"
RUN pip install "click==6.7"
RUN pip install "h5py>=2.8.0"
RUN pip install "Jinja2>=2.9.6"
RUN pip install "pandas>=0.22.0"
RUN pip install "Pillow>=4.3.0"
RUN pip install "scipy>=1.0.0"
RUN pip install "pydot>=1.2.4"
RUN pip install "antlr4-python3-runtime==4.5"
RUN pip install "Cython"
RUN pip install "tensorflow==1.12.0"

# Fix plumber docker env.
RUN echo "export LC_ALL=C.UTF-8" >> ~/.bashrc
RUN echo "export LANG=C.UTF-8" >> ~/.bashrc

CMD ["/bin/bash"]

# To build an image, run:
# docker build -t <a user defined tag> .

# To create a container, run:
# docker create -it <IMAGE ID> /bin/bash

# To start a container, run:
# docker start <CONTAINER ID>

# To access a running container env, run:
# docker exec -it <CONTAINER ID> /bin/bash

# To stop a container, run:
# docker stop <CONTAINER ID>

