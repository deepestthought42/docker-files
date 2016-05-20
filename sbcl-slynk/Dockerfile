FROM deepestthought42/sbcl-1.3.5-quicklisp:20160520
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>


## setup slynk
WORKDIR /lisp/quicklisp/local-projects/
RUN git clone -n https://github.com/capitaomorte/sly.git
RUN git clone -n https://github.com/capitaomorte/sly-named-readtables.git
RUN git clone -n https://github.com/capitaomorte/sly-macrostep.git

WORKDIR /lisp/quicklisp/local-projects/sly/
RUN git checkout 4a0a826

WORKDIR /lisp/quicklisp/local-projects/sly-named-readtables/
RUN git checkout df4ed79

WORKDIR /lisp/quicklisp/local-projects/sly-macrostep/
RUN git checkout eb16778

ADD install.lisp /lisp/install.lisp
RUN sbcl --non-interactive --load /lisp/install.lisp

ARG public_key

RUN mkdir /root/.ssh && echo $public_key > /root/.ssh/authorized_keys
ADD .sbclrc /root/.sbclrc


EXPOSE 22
#ADD startup.sh /root/startup.sh

CMD ["/usr/sbin/sshd", "-D"]
