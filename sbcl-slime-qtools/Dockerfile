FROM deepestthought42/sbcl-1.3.7-slime:20160728
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>


## install packages

RUN apt-get update &&\
    apt-get install -y libqt4-dev 

ARG username
USER $username

RUN sbcl --non-interactive --eval '(ql:quickload :drakma)'
RUN sbcl --non-interactive --eval '(ql:quickload :qtools)'

USER root

CMD ["/usr/sbin/sshd", "-D"]





