# Copyright (c) 2019 Yohei Murayama
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php

FROM alpine:latest
MAINTAINER Yohei Murayama <muracchi@gmail.com>

RUN apk update \
 && apk --no-cache add ${JDK_PKG} curl \
 && rm -rf /var/cache/apk/*

# Download server.jar
RUN mkdir /blynk \
  && curl -L "https://github.com/blynkkk/blynk-server/releases/download/v${BLYNK_SERVER_VERSION}/${JAR_NAME}.jar" > /blynk/server.jar

# Create data folder. To persist data, map a volume to /data
RUN mkdir /data

# Create configuration folder. To persist data, map a file to /config/server.properties
RUN mkdir /config && \
  touch /config/server.properties && \
  touch /config/mail.properties && \
  touch /config/sms.properties

COPY endpoint-blynk.sh /endpoint-blynk.sh

VOLUME ["/data"]

# IP port listing:
# 8080: Hardware without ssl/tls support
# 9443: Blynk app, https, web sockets, admin port
EXPOSE 8080 9443

WORKDIR /data
ENTRYPOINT ["/endpoint-blynk.sh"]
