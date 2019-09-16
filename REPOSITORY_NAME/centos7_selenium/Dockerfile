FROM centos:7

RUN yum update -y \
 && yum install -y epel-release \
 && yum --enablerepo=epel install -y nkf python36 \
 && yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
 && yum clean all

RUN curl https://bootstrap.pypa.io/get-pip.py | python3 - \
 && pip install selenium chromedriver-binary==$( curl http://chromedriver.storage.googleapis.com/LATEST_RELEASE )
# http://chromedriver.chromium.org/downloads

ADD headless-chrome /
