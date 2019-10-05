#!/bin/sh
# Copyright (c) 2019 Yohei Murayama
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php

# Download server.jar
mkdir /blynk \
  && curl -L "https://github.com/blynkkk/blynk-server/releases/download/v${BLYNK_SERVER_VERSION}/server-${BLYNK_SERVER_VERSION}-java8.jar" > /blynk/server.jar

# Create data folder. To persist data, map a volume to /data
mkdir /data

# Create configuration folder. To persist data, map a file to /config/server.properties
mkdir /config && \
  touch /config/server.properties && \
  touch /config/mail.properties && \
  touch /config/sms.properties
