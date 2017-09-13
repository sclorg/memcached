.PHONY: build run debug test doc

IMAGE_NAME = modularitycontainers/memcached
IMAGE_OPTIONS = \
    -p 127.0.0.1:11211:11211

VERSION = 1.14
DISTRO = fedora-26-x86_64
DG = /usr/bin/dg

DG_EXEC = ${DG} --distro ${DISTRO}.yaml --spec specs/configuration.yml --multispec specs/multispec.yml --multispec-selector version=${VERSION}
DISTRO_ID = $(shell ${DG_EXEC} --template "{{ config.os.id }}")

run: build
	docker run -d $(IMAGE_NAME)

debug: build
	docker run -t -i $(IMAGE_OPTIONS) $(IMAGE_NAME) bash

build: doc dg
	docker build --tag=$(IMAGE_NAME) -f Dockerfile.rendered .

test: build
	cd tests; MODULE=docker DOCKERFILE="../Dockerfile.rendered" URL="docker=$(IMAGE_NAME)" make all

doc: dg
	mkdir -p ./root/
	go-md2man -in=help/help.md.rendered -out=./root/help.1

dg:
	${DG_EXEC} --template Dockerfile --output Dockerfile.rendered
	${DG_EXEC} --template help/help.md --output help/help.md.rendered

clean:
	rm -f Dockerfile.*
	rm -f help/help.md.*
	rm -rf root
