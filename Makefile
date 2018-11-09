.PHONY: $(shell test -f common/common.mk || echo >&2 'Please do "git submodule update --init" first.')

BASE_IMAGE_NAME = memcached
VERSIONS = 1.5

include common/common.mk

test: build
	#MODULE=docker DOCKERFILE="../Dockerfile.rendered" URL="docker=$(IMAGE_REPOSITORY)" make -C tests test_mtf
	make -C tests test_conu

clean:
	rm -f Dockerfile.*
	rm -f help/help.md.*
	rm -rf root
