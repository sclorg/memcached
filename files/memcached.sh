#!/bin/bash

MEMCACHED_ARGS=


if [[ ! -z "${MEMCACHED_DEBUG_MODE}" ]]; then
    MEMCACHED_ARGS+=" -vv"
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
