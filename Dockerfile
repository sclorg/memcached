FROM {{ config.docker.registry }}/{{ config.docker.from }}

ENV NAME={{ spec.envvars.name }} \
    VERSION={{ spec.envvars.version }} \
    RELEASE={{ spec.envvars.release }}

LABEL maintainer {{ spec.maintainer }}
LABEL summary="{{ spec.summary }}" \
    name="$FGC/$NAME" \
    version="0" \
    release="1.$DISTTAG" \
    architecture="$ARCH" \
    com.redhat.component="$NAME-container" \
    usage="docker run -p {{ spec.expose }}:{{ spec.expose }} $NAME" \
    help="Runs {{ spec.envvars.name }}, which listens on port 11211. No dependencies. See Help File below for more details." \
    description="{{ spec.description }}" \
    io.k8s.description="{{ spec.description }}" \
    io.k8s.diplay-name="{{ spec.envvars.name }} $VERSION" \
    io.openshift.expose-services="{{ spec.expose }}:{{ spec.envvars.name }}" \
    io.openshift.tags="{{ spec.envvars.name }}"

EXPOSE {{ spec.expose }}

RUN {{ commands.pkginstaller.install(["memcached"]) }} && \
    {{ commands.pkginstaller.cleancache() }}

COPY root /

USER memcached

ENTRYPOINT ["/usr/bin/container-entrypoint"]
