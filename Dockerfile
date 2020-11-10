FROM ubuntu:18.04

# Dependencias
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    qt5-default \
    sudo \
    python3-pip \
    g++-8      \
    && apt-get clean


RUN apt-get update && apt-get install -y \
    meson

RUN pip3 install meson


ENV PATH=/usr/local/python3/bin:$PATH

RUN git clone https://github.com/PinguimBots/ssl-client.git && \
    cd ssl-client 

WORKDIR /ssl-client

ENV CXX=g++-8

RUN meson build && \
    meson compile -C build 

ENV TEAM=black

CMD ./build/pbssl -t $TEAM






