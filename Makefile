# Copyright (c) 2019 Yohei Murayama
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php
REPO = mura1008/rpi-blynk-server
VER = 0.41.12

.PHONY: all
all: java8 java11

.PHONY: java8
java8:
	docker build --build-arg BLYNK_SERVER_VERSION=$(VER) \
		--build-arg JAR_NAME=server-$(VER)-java8 \
		-t $(REPO):$(VER)-java8 -t $(REPO):java8 .

.PHONY: java11
java11:
	docker build --build-arg BLYNK_SERVER_VERSION=$(VER) \
		--build-arg JAR_NAME=server-$(VER) \
		-t $(REPO):$(VER)-java11 -t $(REPO):java11 -t $(REPO):latest -f Dockerfile.java11 .

.PHONY: push
push:
	docker push $(REPO)
