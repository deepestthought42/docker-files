FROM ubuntu:15.10
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>

## install packages
RUN apt-get update
RUN apt-get install -y curl wget rlwrap bzip2 build-essential git

ENV HOME /root

## install sbcl
RUN mkdir /src \
    && curl http://iweb.dl.sourceforge.net/project/sbcl/sbcl/1.3.5/sbcl-1.3.5-x86-64-linux-binary.tar.bz2\
    | tar -xjC /src

WORKDIR /src/sbcl-1.3.5-x86-64-linux
RUN ./install.sh

## download and install quicklisp
RUN mkdir /lisp

WORKDIR /lisp
RUN wget http://beta.quicklisp.org/quicklisp.lisp
ADD install.lisp /lisp/install.lisp


RUN sbcl --non-interactive --load install.lisp
ADD .sbclrc /root/.sbclrc

## setup slynk
WORKDIR /lisp/quicklisp/local-projects/
RUN git clone -n https://github.com/capitaomorte/sly.git

WORKDIR /lisp/quicklisp/local-projects/sly/
RUN git checkout 4a0a826


RUN sbcl --non-interactive --eval "(ql:quickload :slynk)"


