FROM testssl:base

ARG BRANCH

RUN cd /tmp/ && \
    apk add --no-cache git && \
    git clone -b ${BRANCH} --depth=1 https://github.com/drwetter/testssl.sh.git && \
    cd / && \
    cp /tmp/testssl.sh/testssl.sh / && \
    cp /tmp/testssl.sh/etc/* /etc/ && \
    rm -fr /tmp/testssl.sh && \
    apk del --no-cache git && \
    chmod 0755 testssl.sh

ARG CI_BUILD_URL
ARG BUILD_DATE
ARG VCS_REF

# https://support.coreos.com/hc/en-us/articles/115001384693-Tag-Expiration
LABEL \
    quay.expires-after=24w \
    io.github.jumanjiman.ci-build-url=${CI_BUILD_URL} \
    io.github.jumanjiman.version=${BRANCH} \
    io.github.jumanjiman.build-date=${BUILD_DATE} \
    io.github.jumanjiman.vcs-ref=${VCS_REF} \
    io.github.jumanjiman.license="GPL v2" \
    io.github.jumanjiman.docker.dockerfile="/src/Dockerfile" \
    io.github.jumanjiman.vcs-type="Git" \
    io.github.jumanjiman.vcs-url="https://github.com/jumanjihouse/docker-testssl.git"
