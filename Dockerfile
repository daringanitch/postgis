FROM postgres:9.6.4-alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update \
    && apk add -u postgis \
    && rm -rf /var/lib/apt/lists/*

COPY ./scripts/postgis.sh  /docker-entrypoint-initdb.d/postgis.sh
