.PHONY: $(shell test -f common/common.mk || echo >&2 'Please do "git submodule update --init" first.')

BASE_IMAGE_NAME = memcached
VERSIONS = 1.5

include common/common.mk

