FROM ubuntu:18.04

RUN apt update \
 && apt -y upgrade \
 && apt -y install locales-all python3 python3-distutils curl unzip \
 && curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O \
 && apt install -y ./google-chrome-stable_current_amd64.deb \
 && curl https://bootstrap.pypa.io/get-pip.py | python3 - \
 && pip3 install requests selenium chromedriver-binary==$( curl http://chromedriver.storage.googleapis.com/LATEST_RELEASE ) \
 && curl http://chromedriver.storage.googleapis.com/$( curl http://chromedriver.storage.googleapis.com/LATEST_RELEASE )/chromedriver_linux64.zip -O \
 && unzip chromedriver_linux64.zip -d /usr/local/bin \
 && apt -y install vim wget less locate

ENV LANG=en_US.utf8

ADD login-access /
ADD headless-chrome /
