FROM deepestthought42/sbcl:1.3.5
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>


## download and install quicklisp
RUN mkdir /lisp

WORKDIR /lisp
RUN wget http://beta.quicklisp.org/quicklisp.lisp
ADD install.lisp /lisp/install.lisp


RUN sbcl --non-interactive --load install.lisp
ADD .sbclrc /root/.sbclrc
