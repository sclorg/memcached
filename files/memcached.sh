#!/bin/bash

MEMCACHED_ARGS=

if [[ ! -z "${DEBUG_MODE}" ]]; then
    rpm -q syslog-ng
    if [[ $? -ne 0 ]]; then
        dnf -y --setopt=tsflags=nodocs install syslog-ng && \
        dnf -y clean all
        syslog-ng
    fi

fi

if [[ ! -z "${MEMCACHED_CACHE_SIZE}" ]]; then
    MEMCACHED_ARGS+=" -m $MEMCACHED_CACHE_SIZE"
fi

if [[ ! -z "${MEMCACHED_CONNECTIONS}" ]]; then
    MEMCACHED_ARGS+=" -c $MEMCACHED_CONNECTIONS"
fi

if [[ ! -z "${MEMCACHED_THREADS}" ]]; then
    MEMCACHED_ARGS+=" -t $MEMCACHED_THREADS"
fi

# Run memcached binary
/usr/bin/memcached -u daemon $MEMCACHED_ARGS
