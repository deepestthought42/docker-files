FROM deepestthought42/c2ffi-3.7:20160520
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>


## install packages

RUN apt-get update &&\
    apt-get install -y curl wget rlwrap libffi-dev\
    	    	       pkg-config zlib1g-dev libpng12-dev\
                       libfontconfig1-dev libcairo2-dev libgsl0-dev


ARG username
RUN useradd -ms /bin/bash $username

## install ccl
WORKDIR /home/$username/lisp

ENV HOME /home/$username

## install sbcl
RUN curl http://superb-sea2.dl.sourceforge.net/project/sbcl/sbcl/1.3.7/sbcl-1.3.7-x86-64-linux-binary.tar.bz2 | tar -xjC /home/$username/lisp

WORKDIR /home/$username/lisp/sbcl-1.3.7-x86-64-linux/
RUN chown -R $username:$username /home/$username/

USER $username

ARG public_key
RUN mkdir /home/$username/.ssh && echo $public_key > /home/$username/.ssh/authorized_keys



USER root
RUN ./install.sh

USER $username

## download and install quicklisp

WORKDIR /home/$username/lisp/

RUN wget http://beta.quicklisp.org/quicklisp.lisp
ADD install.lisp /home/$username/lisp/install.lisp
RUN sbcl --non-interactive --load /home/$username/lisp/install.lisp


ADD .sbclrc /home/$username/.sbclrc

EXPOSE 22

USER root

RUN apt-get update && apt-get install -y gnuplot5 x11-utils

RUN locale-gen en_CA.UTF-8
RUN dpkg-reconfigure locales

CMD ["/usr/sbin/sshd", "-D"]





