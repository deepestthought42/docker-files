FROM ubuntu:15.10
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>
RUN apt-get update
RUN apt-get install -y wget rlwrap bzip2 build-essential
RUN mkdir /src && cd /src
RUN wget http://iweb.dl.sourceforge.net/project/sbcl/sbcl/1.3.5/sbcl-1.3.5-x86-64-linux-binary.tar.bz2
RUN tar xjf sbcl-1.3.5-x86-64-linux-binary.tar.bz2
RUN cd /src/sbcl-1.3.5-x86-64-linux && ./install

