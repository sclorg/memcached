#!/bin/bash

MEMCACHED_CONF="/etc/sysconfig/memcached"

if [[ ! -z "${DEBUG_MODE}" ]]; then
    rpm -q syslog-ng
    if [[ $? -ne 0 ]]; then
        dnf -y --setopt=tsflags=nodocs install syslog-ng && \
        dnf -y clean all
        syslog-ng
    fi

fi

if [[ ! -z "${THREADS_NUM}" ]]; then
    grep "OPTIONS=" $MEMCACHED_CONF
    if [[ $? -eq 0 ]]; then
        echo "OPTIONS="-l 127.0.0.1,::1 -t ${THREADS_NUM}"" >> $MEMCACHED_CONF
    fi
fi
# Run memcached binary
/usr/bin/memcached