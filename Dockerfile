FROM fedora:26

# memcached image for OpenShift.
#
# Environment:
#  * $CACHE_SIZE - Cache size for memcached
# Ports:
#  * 11211

RUN dnf install -y --setopt=tsflags=nodocs memcached && \
    dnf -y clean all

LABEL MAINTAINER "Petr Hracek" <phracek@redhat.com>
LABEL summary="High Performance, Distributed Memory Object Cache" \
    Name="$FGC/memcached" \
    Version="0" \
    Release="1.$DISTTAG" \
    Architecture="$ARCH" \
    Usage="docker run -p 11211:11211 f26/memcached" \
    description="memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load." \
    io.k8s.description="memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load." \
    io.k8s.diplay-name="Memcached 1.4 " \
    io.openshift.expose-services="11211:memcached" \
    io.openshift.tags="memcached"

ADD files /files
ADD help.md README.md /

EXPOSE 11211

# memcached will be run under standard user on Fedora
USER 1000

CMD ["/files/memcached.sh"]