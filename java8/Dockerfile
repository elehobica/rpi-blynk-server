# Copyright (c) 2019 Yohei Murayama
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php

FROM alpine:latest
MAINTAINER Yohei Murayama <muracchi@gmail.com>

ENV BLYNK_SERVER_VERSION 0.41.11

RUN apk update \
 && apk --no-cache add openjdk8 curl \
 && rm -rf /var/cache/apk/*

COPY setup.sh /setup.sh
COPY endpoint-blynk.sh /endpoint-blynk.sh

# Setup container
RUN /setup.sh

VOLUME ["/data"]

# IP port listing:
# 8080: Hardware without ssl/tls support
# 9443: Blynk app, https, web sockets, admin port
EXPOSE 8080 9443

WORKDIR /data
ENTRYPOINT ["/endpoint-blynk.sh"]
