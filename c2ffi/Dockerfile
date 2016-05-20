FROM deepestthought42/clang-3.7:20160519
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>

## install packages

ENV HOME /root

RUN apt-get update && apt-get install -y libedit-dev libz-dev

WORKDIR /src
RUN git clone -n https://github.com/rpav/c2ffi

WORKDIR /src/c2ffi
# checking out what works
RUN git checkout 970235c4f2cf3ff8b6346eaed49ec81557a68467

WORKDIR /src/c2ffi/build
RUN cmake ../ && make -j 4 install






