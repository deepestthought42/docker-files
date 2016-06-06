FROM deepestthought42/c2ffi-3.7:20160520
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>

## install packages
RUN apt-get update
RUN apt-get install -y curl wget rlwrap libffi-dev




ARG username
RUN useradd -ms /bin/bash $username

## install ccl
WORKDIR /home/$username/lisp

RUN curl ftp://ftp.clozure.com/pub/release/1.11/ccl-1.11-linuxx86.tar.gz | tar -xzC /home/$username/lisp/


ARG public_key
RUN mkdir /home/$username/.ssh && echo $public_key > /home/$username/.ssh/authorized_keys


RUN wget http://beta.quicklisp.org/quicklisp.lisp
ADD install.lisp /home/$username/lisp/install.lisp

RUN chown -R renee:renee /home/$username/*


USER $username
ENV HOME=/home/$username

RUN /home/$username/lisp/ccl/lx86cl64 -b -l install.lisp


ADD .ccl-init.lisp /home/$username/.ccl-init.lisp
RUN chown -R renee:renee /home/$username/*

EXPOSE 22

USER root
CMD ["/usr/sbin/sshd", "-D"]


