from ubuntu:16.04
maintainer hao jiang (hao.jiang@corerain.com)
env debian_frontend noninteractive
env debconf_nowarnings yes

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
    && make -j4 \
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
    && make -j4 \
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
    && make -j4 \
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
    && make -j4 \
    && make install \
    && ldconfig

# House cleanning
RUN rm -rf /workspace/tmp/eigen-eigen-b3f3d4950030.tar.bz2
RUN rm -rf /workspace/tmp/eigen-eigen-b3f3d4950030

# Install glog
RUN cd /workspace/tmp/ \
    && wget -O glog-0.3.5.zip \
    https://codeload.github.com/google/glog/zip/v0.3.5 \
    && unzip glog-0.3.5.zip \
    && cd glog-0.3.5 \
    && ./configure \
    && make -j4 \
    && make install \
    && ldconfig

# House cleanning
RUN rm -rf /workspace/tmp/glog-0.3.5.zip
RUN rm -rf /workspace/tmp/glog-0.3.5

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

# Fix plumber docker env.
RUN echo "export LC_ALL=C.UTF-8" >> ~/.bashrc
RUN echo "export LANG=C.UTF-8" >> ~/.bashrc

# Install exVim
RUN cd /workspace/tmp/ \
    && git clone https://github.com/exvim/main \
    && cd main \
    && sh unix/install.sh \
    && sh unix/replace-my-vim.sh

RUN apt-get update -y \
    && apt-get install -y \
    id-utils \
    gawk \
    ctags

# Fix exVim warning from C.UTF-8
RUN sed -i "45s/.*/        silent exec 'language C.UTF-8'/" ~/.vimrc

# House cleanning
RUN rm -rf /workspace/tmp/main

# Install CUDA and CUDNN
RUN cd /workspace/tmp/ \
    && wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
RUN cd /workspace/tmp/ \
    && wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb
RUN cd /workspace/tmp/ \
    && wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.0.5.15-1+cuda9.0_amd64.deb
RUN cd /workspace/tmp/ \
    && wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnccl2_2.1.4-1+cuda9.0_amd64.deb
RUN cd /workspace/tmp/ \
    && wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnccl-dev_2.1.4-1+cuda9.0_amd64.deb
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
RUN cd /workspace/tmp/ \
    && dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb \
    && dpkg -i libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb \
    && dpkg -i libcudnn7-dev_7.0.5.15-1+cuda9.0_amd64.deb \
    && dpkg -i libnccl2_2.1.4-1+cuda9.0_amd64.deb \
    && dpkg -i libnccl-dev_2.1.4-1+cuda9.0_amd64.deb

RUN cd /workspace/tmp/ \
    && apt-get -y update \
    && apt-get install -y \
    cuda=9.0.176-1 \
    libcudnn7-dev \
    libnccl-dev

RUN echo "export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}" >> ~/.bashrc
RUN echo "export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc

# House cleanning
RUN rm -rf /workspace/tmp/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
RUN rm -rf /workspace/tmp/libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb
RUN rm -rf /workspace/tmp/libcudnn7-dev_7.0.5.15-1+cuda9.0_amd64.deb
RUN rm -rf /workspace/tmp/libnccl2_2.1.4-1+cuda9.0_amd64.deb
RUN rm -rf /workspace/tmp/libnccl-dev_2.1.4-1+cuda9.0_amd64.deb

# Install tensorflow_gpu
RUN cd /workspace/tmp \
    && wget -O tensorflow_gpu-1.12.0-cp35-cp35m-manylinux1_x86_64.whl \
    https://files.pythonhosted.org/packages/0a/b2/eea4d2afb868403dbbc0518e0a62814c59517ab2bff20d5d754ba7984b2c/tensorflow_gpu-1.12.0-cp35-cp35m-manylinux1_x86_64.whl
RUN cd /workspace/tmp \
    && pip install "tensorflow_gpu-1.12.0-cp35-cp35m-manylinux1_x86_64.whl" \
    --ignore-installed
RUN rm /usr/bin/python
RUN ln -s /usr/bin/python3 /usr/bin/python

# House cleanning
RUN rm -rf /workspace/tmp/tensorflow_gpu-1.12.0-cp35-cp35m-manylinux1_x86_64.whl

# Finished
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
