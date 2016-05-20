FROM deepestthought42/sbcl-1.3.5-slynk:20160520
MAINTAINER Renee Klawitter <deepestthought42@gmail.com>

RUN apt-get update
RUN apt-get install -y libffi-dev pkg-config zlib1g-dev libpng12-dev\
    	    	       libfontconfig1-dev libcairo2-dev libgsl0-dev

WORKDIR /src

RUN curl http://netix.dl.sourceforge.net/project/ibsimu/ibsimu/libibsimu-1.0.6.tar.gz\
    | tar -xzC /src

WORKDIR /src/libibsimu-1.0.6
RUN ./configure && make -j 4 && make install

CMD ["/usr/sbin/sshd", "-D"]
