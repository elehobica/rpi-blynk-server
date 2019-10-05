# Copyright (c) 2019 Yohei Murayama
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php
REPO = mura1008/rpi-blynk-server
VER = 0.41.11

.PHONY: all
all: java8 java11

.PHONY: java8
java8:
	sudo docker build java8 --tag $(REPO):$(VER)-java8 --tag $(REPO):latest-java8

.PHONY: java11
java11:
	sudo docker build java11 --tag $(REPO):$(VER)-java11 --tag $(REPO):latest-java11 --tag $(REPO):latest

.PHONY: push
push:
	sudo docker push $(REPO)
