FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
MAINTAINER hao jiang (hao.jiang@corerain.com)
ENV debian_frontend noninteractive
ENV debconf_nowarnings yes

RUN echo "-------------------------------------------------------" \
    && echo "Install necessary packages" \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
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
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    autoconf \
    automake \
    libgtk2.0-dev \
    pkg-config\
    curl \
    wget \
    net-tools \
    software-properties-common \
    python3 \
    python3-dev \
    python3-pip \
    id-utils \
    gawk \
    ctags \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/* \
           /usr/share/doc/* \
    && mkdir -p /workspace/tmp \
    && echo "-------------------------------------------------------" \
    && echo "Install OpenCV for C and C++" \
    && cd /workspace/tmp/ \
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
    && ldconfig \
    && rm -rf /workspace/tmp/* \
    && echo "-------------------------------------------------------" \
    && ehco "Install protobuf" \
    && cd /workspace/tmp/ \
    && wget -O protobuf-3.5.1.1.zip \
    https://codeload.github.com/protocolbuffers/protobuf/zip/3.5.1.1 \
    && unzip protobuf-3.5.1.1.zip \
    && cd protobuf-3.5.1.1 \
    && ./autogen.sh \
    && ./configure \
    && make -j4 \
    && make check \
    && make install \
    && ldconfig \
    && rm -rf /workspace/tmp/* \
    && echo "-------------------------------------------------------" \
    && echo "Install gtest" \
    && cd /workspace/tmp/ \
    && wget -O googletest-release-1.8.0.zip \
    https://codeload.github.com/google/googletest/zip/release-1.8.0 \
    && unzip googletest-release-1.8.0.zip \
    && cd googletest-release-1.8.0 \
    && mkdir -p build \
    && cd build \
    && cmake .. -G"Unix Makefiles" \
                -DCMAKE_BUILD_TYPE=release \
                -DCMAKE_INSTALL_PREFIX=/usr/local/ \
                -DBUILD_SHARED_LIBS=true \
                -DBUILD_STATIC_LIBS=true \
    && make -j4 \
    && make install \
    && ldconfig \
    && rm -rf /workspace/tmp/* \
    && echo "-------------------------------------------------------" \
    && echo "Install gflags" \
    && cd /workspace/tmp/ \
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
    && ldconfig \
    && rm -rf /workspace/tmp/* \
    && echo "-------------------------------------------------------" \
    && echo "Install eigen" \
    && cd /workspace/tmp/ \
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
    && ldconfig \
    && rm -rf /workspace/tmp/* \
    && echo "-------------------------------------------------------" \
    && echo "Install glog" \
    && cd /workspace/tmp/ \
    && wget -O glog-0.3.3.zip \
    https://codeload.github.com/google/glog/zip/v0.3.3 \
    && unzip glog-0.3.3.zip \
    && cd glog-0.3.3 \
    && ./configure \
    && make -j4 \
    && make install \
    && ldconfig \
    && rm -rf /workspace/tmp/* \
    && echo "-------------------------------------------------------" \
    && echo "Pip install" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "numpy==1.15.4" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "opencv-python=3.4.0.14" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "setuptools" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "click==6.7" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "h5py>=2.8.0" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "Jinja2>=2.9.6" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "pandas>=0.22.0" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "Pillow>=4.3.0" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "scipy>=1.0.0" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "pydot>=1.2.4" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "antlr4-python3-runtime==4.5" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "Cython" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "tensorflow-gpu==1.12.0" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "decorator==4.4.0" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "typing==3.7.4" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "typing_extensions==3.7.4" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "networkx==2.3" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "onnx==1.5.0" \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "tqdm==4.32.2" \
    && echo "export LC_ALL=C.UTF-8" >> ~/.bashrc \
    && echo "export LANG=C.UTF-8" >> ~/.bashrc \
    && echo "-------------------------------------------------------" \
    && "Install exVim" \
    && cd /workspace/tmp/ \
    && git clone https://github.com/exvim/main \
    && cd main \
    && sh unix/install.sh \
    && sh unix/replace-my-vim.sh \
    && sed -i "45s/.*/        silent exec 'language C.UTF-8'/" ~/.vimrc \
    && rm -rf /workspace/tmp/main \
    && echo "-------------------------------------------------------" \
    && echo "Python3 alias" \
    && echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/python3.5/dist-packages/" >> ~/.bashrc \
    && rm /usr/bin/python \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip

# Finished
CMD ["/bin/bash"]

# To build an image:
# docker build -t <image_name>:<image_tag> -f <Dockerfile_name> .
