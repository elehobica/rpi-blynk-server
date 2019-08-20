#!/bin/sh
# Copyright (c) 2019 Yohei Murayama
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php
java -jar /blynk/server.jar -dataFolder /data -serverConfig /config/server.properties -mailConfig /config/mail.properties -smsConfig /config/sms.properties
