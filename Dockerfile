FROM fedora:24

# memcached image for OpenShift.
#
# Environment:
#  * $CACHE_SIZE - Cache size for memcached
# Ports:
#  * 11211

RUN dnf install -y --setopt=tsflags=nodocs memcached && \
    dnf -y clean all

LABEL summary="High Performance, Distributed Memory Object Cache" \
    version="1.0" \
    description="memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load." \
    io.k8s.description="memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load." \
    io.k8s.diplay-name="Memcached 1.4 " \
    io.openshift.expose-services="11211:memcached" \
    io.openshift.tags="memcached"

ADD files /files
MAINTAINER "Petr Hracek" <phracek@redhat.com>

EXPOSE 11211

# memcached will be run under standard user on Fedora
USER 1000

CMD ["/files/memcached.sh"]
