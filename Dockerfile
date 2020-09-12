FROM ubuntu:20.10
MAINTAINER Richard Yu <xiaoqingfengatgm@gmail.com>
# https://github.com/xiaoqingfengATGH/lantern
# lastest lantern version: 6.0.9
WORKDIR /root
RUN apt-get update  && \
         apt-get -y install wget libappindicator3-1 && \
	 wget -O lantern.deb https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb?ver=6.0.9 && \
	 wget -O settings.yaml https://raw.githubusercontent.com/xiaoqingfengATGH/lantern/master/settings.yaml?ver=6.0.9 && \
         dpkg -i lantern.deb && \
         rm -rf lantern.deb && \
         apt-get -f install && \
         apt-get clean && \
         rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
         mkdir /root/.lantern && \
         mv settings.yaml /root/.lantern/settings.yaml

EXPOSE 3128/tcp 8080/tcp 3129/tcp

ENTRYPOINT ["/usr/bin/lantern", "--configdir=/root/.lantern", "--headless=true"]
