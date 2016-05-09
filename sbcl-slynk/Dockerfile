FROM deepestthought42/sbcl-quicklisp:1.3.5
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>


## setup slynk
WORKDIR /lisp/quicklisp/local-projects/
RUN git clone -n https://github.com/capitaomorte/sly.git

WORKDIR /lisp/quicklisp/local-projects/sly/
RUN git checkout 4a0a826


RUN sbcl --non-interactive --eval "(ql:quickload :slynk)"

