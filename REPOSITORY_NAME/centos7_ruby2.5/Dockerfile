ARG repo_name

FROM ${repo_name}/centos7_custom:latest

ADD ruby-2.5.1.tar.gz /var/tmp/

RUN \
 cd /var/tmp/ruby-2.5.1/ \
 && ./configure --enable-shared --prefix=/usr/local/bin/ruby-2.5.1 \
 && make \
 && make install

