FROM centos:7

RUN yum update -y

RUN yum install -y \
 epel-release gcc gcc-c++ git libxml2-devel libxslt-devel \
 make mariadb mariadb-server mysql-devel \
 openssl-devel readline-devel zlib-devel \
 iproute net-tools

RUN yum install -y --enablerepo=epel nodejs

RUN yum clean all

#ADD ruby-2.4.4.tar.gz /var/tmp/
#ADD ruby-2.3.7.tar.gz /var/tmp/
ADD ruby-2.2.10.tar.gz /var/tmp/

RUN cd /var/tmp/ruby-2.2.10/ \
 && ./configure --enable-shared && make && make install

RUN gem install bundler
RUN gem install json -v '1.8.3' -- --use-system-libraries
RUN gem install nokogiri -v '1.6.6.2' -- --use-system-libraries

RUN cd /var/tmp/ \
 && git clone https://github.com/ermtmt/choseisan.git \
 && cd choseisan/ \
 && bundle install

#EXPOSE 3000
ADD start.sh /var/tmp/
CMD ["/var/tmp/start.sh"]
