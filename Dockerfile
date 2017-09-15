FROM {{ config.docker.registry }}/{{ config.docker.from }}

# Environment:
#  * $CACHE_SIZE - Cache size for memcached
# Ports:
#  * 11211

ENV NAME={{ spec.envvars.name }} \
    VERSION={{ spec.envvars.version }} \
    RELEASE={{ spec.envvars.release }} \
    ARCH={{ spec.envvars.arch }}
MAINTAINER {{ spec.maintainer }}
LABEL summary="High Performance, Distributed Memory Object Cache" \
    name="$FGC/$NAME" \
    version="0" \
    release="1.$DISTTAG" \
    architecture="$ARCH" \
    com.redhat.component=$NAME \
    usage="docker run -p 127.0.0.1:{{ spec.expose }}:{{ spec.expose }} docker.io/modularitycontainers/memcached" \
    help="Runs memcached, which listens on port 11211. No dependencies. See Help File below for more details." \
    description="memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load." \
    io.k8s.description="memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load." \
    io.k8s.diplay-name="Memcached 1.4 " \
    io.openshift.expose-services="{{ spec.expose }}:{{ spec.envvars.name }}" \
    io.openshift.tags="{{ spec.envvars.name }}"

RUN {{ commands.pkginstaller.install(["memcached"]) }} && \
    {{ commands.pkginstaller.cleancache() }}

ADD files /files
ADD root/help.1 /help.1

EXPOSE {{ spec.expose }}

# memcached will be run under standard user on Fedora
USER 1000

CMD ["/files/memcached.sh"]
