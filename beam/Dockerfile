FROM ubuntu:18.04
MAINTAINER Richard Yu <xiaoqingfengatgm@gmail.com>
# https://github.com/xiaoqingfengATGH/lantern
# lastest beam version 0.1.19
WORKDIR /root
RUN apt-get update  && \
         apt-get -y install wget libappindicator3-1 && \
	 wget -O beam.deb https://raw.githubusercontent.com/xiaoshoudian/xiazai/main/beam-installer-64-bit.deb?ver=0.1.19 && \
	 wget -O settings.yaml https://raw.githubusercontent.com/xiaoqingfengATGH/lantern/master/settings.yaml?ver=0.1.19 && \
         dpkg -i beam.deb && \
         rm -rf beam.deb && \
         apt-get -f install && \
         apt-get clean && \
         rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
         mkdir /root/.beam && \
         mv settings.yaml /root/.beam/settings.yaml

EXPOSE 3128/tcp 8080/tcp 3129/tcp

ENTRYPOINT ["/usr/bin/beam", "--configdir=/root/.beam", "--headless=true"]
