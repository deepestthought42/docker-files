FROM deepestthought42/build-essentials:0.1
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>

## install packages
RUN apt-get update
RUN apt-get install -y curl wget rlwrap libffi-dev

ENV HOME /root

## install sbcl
RUN mkdir /src \
    && curl http://iweb.dl.sourceforge.net/project/sbcl/sbcl/1.3.5/sbcl-1.3.5-x86-64-linux-binary.tar.bz2\
    | tar -xjC /src

WORKDIR /src/sbcl-1.3.5-x86-64-linux
RUN ./install.sh


