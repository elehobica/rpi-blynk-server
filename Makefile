# Copyright (c) 2019 Yohei Murayama
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php
REPO = mura1008/rpi-blynk-server
VER = 0.41.14

.PHONY: all
all: java8 java11

.PHONY: java8
java8:
	docker buildx build --platform=linux/arm/v7 --build-arg BLYNK_SERVER_VERSION=$(VER) \
		--build-arg JAVA_PKG=openjdk8-jre --build-arg JAR_NAME=server-$(VER)-java8 \
		-t $(REPO):$(VER)-java8-arm .
	docker build --build-arg BLYNK_SERVER_VERSION=$(VER) \
		--build-arg JAVA_PKG=openjdk8-jre --build-arg JAR_NAME=server-$(VER)-java8 \
		-t $(REPO):$(VER)-java8-arm64 .

.PHONY: java11
java11:
	docker build --build-arg BLYNK_SERVER_VERSION=$(VER) \
		--build-arg JAVA_PKG=openjdk11-jre-headless --build-arg JAR_NAME=server-$(VER) \
		-t $(REPO):$(VER)-java11 -t $(REPO):java11 -t $(REPO):latest .

.PHONY: push
push:
	docker push $(REPO):$(VER)-java11
	docker push $(REPO):java11
	docker push $(REPO):latest
	docker push $(REPO):$(VER)-java8-arm
	docker push $(REPO):$(VER)-java8-arm64
	docker manifest create $(REPO):$(VER)-java8 $(REPO):$(VER)-java8-arm $(REPO):$(VER)-java8-arm64
	docker manifest annotate --arch arm $(REPO):$(VER)-java8 $(REPO):$(VER)-java8-arm
	docker manifest annotate --arch arm64 $(REPO):$(VER)-java8 $(REPO):$(VER)-java8-arm64
	docker manifest create $(REPO):java8 $(REPO):$(VER)-java8-arm $(REPO):$(VER)-java8-arm64
	docker manifest annotate --arch arm $(REPO):java8 $(REPO):$(VER)-java8-arm
	docker manifest annotate --arch arm64 $(REPO):java8 $(REPO):$(VER)-java8-arm64
	docker manifest push $(REPO):$(VER)-java8
	docker manifest push $(REPO):java8
