FROM linuxserver/baseimage

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8842ce5e && \
    echo "deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu trusty main" > /etc/apt/sources.list.d/bitcoin.list

ENV APTLIST="bitcoind"

RUN apt-get update -q && \
    apt-get install -y $APTLIST && \
    apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# Adding Custom files
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run

VOLUME /config
EXPOSE 8333 8332