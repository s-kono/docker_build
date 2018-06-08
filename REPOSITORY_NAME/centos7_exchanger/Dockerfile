FROM centos:7

ADD ruby-2.5.1.tar.gz /var/tmp/

RUN yum update -y \
 && yum install -y gcc make openssl-devel zlib-devel

RUN \
 cd /var/tmp/ruby-2.5.1/ \
 && ./configure --enable-shared --prefix=/usr/local/bin/ruby-2.5.1 \
 && make \
 && make install

RUN \
 /usr/local/bin/ruby-2.5.1/bin/gem install exchanger

