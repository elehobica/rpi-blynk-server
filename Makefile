# Copyright (c) 2019 Yohei Murayama
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php
REPO = mura1008/rpi-blynk-server
VER = 0.41.11

.PHONY: all
all: java8 java11

.PHONY: java8
java8:
	sudo docker build --build-arg BLYNK_SERVER_VERSION=$(VER) \
	       	--build-arg JDK_PKG=openjdk8 \
		--build-arg JAR_NAME=server-$(VER)-java8.jar \
		-t $(REPO):$(VER)-java8 -t $(REPO):java8 .

.PHONY: java11
java11:
	sudo docker build --build-arg BLYNK_SERVER_VERSION=$(VER) \
		--build-arg JDK_PKG=openjdk11 \
		--build-arg JAR_NAME=server-$(VER).jar \
		-t $(REPO):$(VER)-java11 -t $(REPO):java11 --tag $(REPO):latest .

.PHONY: push
push:
	sudo docker push $(REPO)
