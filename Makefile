DRUPAL_NODE_VER ?= 1.0.10
DRUPAL_NODE_VER_MINOR ?= $(shell echo "${DRUPAL_NODE_VER}" | grep -oE '^[0-9]+\.[0-9]+')

REPO = wodby/drupal-node
NAME = drupal-node-$(DRUPAL_NODE_VER_MINOR)

TAG ?= $(DRUPAL_NODE_VER_MINOR)

ifneq ($(STABILITY_TAG),)
    ifneq ($(TAG),latest)
        override TAG := $(TAG)-$(STABILITY_TAG)
    endif
endif

.PHONY: build test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) --build-arg DRUPAL_NODE_VER=$(DRUPAL_NODE_VER) ./

test:
#	cd tests/7 && IMAGE=$(REPO):$(TAG) ./run.sh
	cd tests/8 && IMAGE=$(REPO):$(TAG) ./run.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) $(PARAMS) -ti $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) $(PARAMS) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PARAMS) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
