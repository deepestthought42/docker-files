FROM deepestthought42/sbcl-1.3.5-quicklisp:20160606
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>


## setup slynk
ADD install.lisp /lisp/install.lisp
RUN sbcl --non-interactive --load /lisp/install.lisp

ARG public_key

RUN mkdir /root/.ssh && echo $public_key > /root/.ssh/authorized_keys
ADD .sbclrc /root/.sbclrc


EXPOSE 22
#ADD startup.sh /root/startup.sh

ARG username

RUN useradd -ms /bin/bash $username

CMD ["/usr/sbin/sshd", "-D"]
