.PHONY: build run default debug test doc upstream downstream

IMAGE_NAME = modularitycontainers/memcached
IMAGE_OPTIONS = \
    -p 11211:11211

VARIANT = "--multispec-selector variant=upstream"
DISTRO = fedora-26-x86_64
DG = /usr/bin/dg

DG_EXEC = ${DG} --distro ${DISTRO}.yaml --spec specs/configuration.yml --multispec specs/multispec.yml $(VARIANT)
DISTRO_ID = $(shell ${DG_EXEC} --template "{{ config.os.id }}")

default: run

run: build
	docker run -d $(IMAGE_NAME)

debug: build
	docker run -t -i $(IMAGE_OPTIONS) -e MEMCACHED_DEBUG_MODE $(IMAGE_NAME) bash

build: doc dg
	docker build --tag=$(IMAGE_NAME) -f Dockerfile.rendered .

test: build
	cd tests; MODULE=docker DOCKERFILE="../Dockerfile.rendered" URL="docker=$(IMAGE_NAME)" mtf *.py

doc: dg
	mkdir -p ./root/
	go-md2man -in=help/help.md.rendered -out=./root/help.1

upstream:
	make -e doc VARIANT="--multispec-selector variant=upstream"

downstream:
	make -e doc VARIANT="--multispec-selector variant=downstream"

dg:
	${DG_EXEC} --template Dockerfile --output Dockerfile.rendered
	${DG_EXEC} --template help/help.md --output help/help.md.rendered

clean:
	rm -f Dockerfile.*
	rm -f help/help.md.*
	rm -rf root
