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
