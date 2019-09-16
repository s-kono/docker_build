FROM centos:7

RUN yum update -y \
 && yum install -y gcc make openssl-devel zlib-devel less wget vim

WORKDIR /var/tmp/

RUN \
 wget https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.5.tar.xz \
 && tar -Jxf ruby-2.5.5.tar.xz \
 && cd ./ruby-2.5.5/ \
 && ./configure --enable-shared --prefix=/usr/local/bin/ruby-2.5.5 \
 && make \
 && make install
