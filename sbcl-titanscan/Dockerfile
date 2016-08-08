FROM deepestthought42/sbcl-1.3.7-slime-qtools:20160728
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>


## install packages

RUN apt-get update && apt-get install -y libsmokeqt4-dev gdb

ARG username

WORKDIR /home/$username/c

RUN chown -R $username:$username /home/$username/
RUN  echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config

USER $username

RUN git clone https://github.com/deepestthought42/smoke-qcustomplot.git

WORKDIR /home/$username/c/smoke-qcustomplot/smoke
RUN qmake && make -j 4



ADD id_rsa /home/$username/.ssh/id_rsa
ADD id_rsa.pub /home/$username/.ssh/id_rsa.pub

USER root
RUN cp /home/$username/c/smoke-qcustomplot/smoke/*.so* /usr/lib

RUN chown $username:$username ~/.ssh/id_rsa*
RUN chmod 600 ~/.ssh/id_rsa
RUN chmod 644 ~/.ssh/id_rsa.pub
USER $username

RUN eval 'ssh-agent -s'

RUN ssh -o StrictHostKeyChecking=no ebit@titan02.triumf.ca uptime


WORKDIR /home/$username/
RUN git clone ssh://ebit@titan02.triumf.ca/home/ebit/Renee/src/lisp/titan-scan.project

WORKDIR /home/$username/titan-scan.project/

RUN git submodule init 
RUN git submodule update --recursive
RUN cd easysoftdac && git submodule init && git submodule update

ADD .sbclrc /home/$username/.sbclrc

RUN cd /home/$username/titan-scan.project/qtperformance/native/ && make

ENV LANG en_CA.UTF-8
ENV LANGUAGE en_CA:en
ENV LC_ALL en_CA.UTF-8 

RUN export QL_SOURCE_DIRS=/home/$username/titan-scan.project; sbcl --non-interactive --eval '(ql:quickload :scan-viewer)'
RUN export QL_SOURCE_DIRS=/home/$username/titan-scan.project; sbcl --non-interactive --eval '(ql:quickload :cl-protobufs)'

USER root
RUN apt-get update && apt-get install -y libzmq3-dev
USER $username

RUN export QL_SOURCE_DIRS=/home/$username/titan-scan.project; sbcl --non-interactive --eval '(ql:quickload :titan-control)'

USER root

CMD ["/usr/sbin/sshd", "-D"]





