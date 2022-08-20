# Blynk Server Docker Image for Raspberry Pi

[![](https://images.microbadger.com/badges/image/mura1008/rpi-blynk-server.svg)](http://microbadger.com/images/mura1008/rpi-blynk-server
"Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/mura1008/rpi-blynk-server.svg)](http://microbadger.com/images/mura1008/rpi-blynk-server
"Get your own version badge on microbadger.com")

Runs your own [Blynk Server](https://github.com/blynkkk/blynk-server) in a Docker container instead of relying on Blynk's public server.

[Blynk](http://www.blynk.cc) is the "first drag-n-drop IoT app builder for Arduino, Raspberry Pi, ESP8266, SparkFun boards, and others." Super fun.

## How To Build

```sh
$ git clone https://github.com/elehobica/rpi-blynk-server.git
$ cd rpi-blynk-server
$ vim server.properties
$ sudo ./build.sh
```

## How To Use It

* include your own server.properties file by mounting it into /config/server.properties
* persist data, mount a directory into the container
* forward IP ports from the host to the container

```sh
$ mkdir data
$ sudo docker run -v $PWD/data:/data -v $PWD/server.properties:/config/server.properties -p 9443:9443 -p 8440:8440 -p 8080:8080 elehobica/rpi-blynk-server:v1 -dataFolder /data -serverConfig /config/server.properties
docker run mura1008/rpi-blynk-server:latest
```

## Deploy
$ sudo ./deploy.sh

## Login

* login from https://(IP Address):9443/admin
