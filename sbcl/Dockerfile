FROM deepestthought42/c2ffi-3.7:20160520
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>

## install packages
RUN apt-get update
RUN apt-get install -y curl wget rlwrap libffi-dev

ENV HOME /root

## install sbcl
RUN curl http://iweb.dl.sourceforge.net/project/sbcl/sbcl/1.3.15/sbcl-1.3.15-x86-64-linux-binary.tar.bz2\
    | tar -xjC /src

WORKDIR /src/sbcl-1.3.15-x86-64-linux
RUN ./install.sh


