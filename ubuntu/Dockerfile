FROM ubuntu:18.04
MAINTAINER Hao Jiang (joshtrick@outlook.com)
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes
ENV TERM xterm-256color

RUN apt-get update -y \
    && apt-get upgrade -y\
    && apt-get install -y --no-install-recommends \
    sudo \
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
    id-utils \
    gawk \
    ctags \
    python3 \
    python3-dev \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/* \
           /usr/share/doc/* \
    && python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
RUN useradd -ms /bin/bash docker \
    && echo "docker:admin" | chpasswd \
    && adduser docker sudo
USER docker
WORKDIR /home/docker


# Finished
CMD /bin/bash

# To build an image:
# docker build -t <image_name>:<image_tag> -f <Dockerfile_name> .
