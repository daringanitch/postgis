FROM postgres:10.10-alpine

MAINTAINER Darin Ganitch <dganitch@illuminate.solutions>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update \
    && apk add apk-tools \
    && apk add -u postgis \
    && rm -rf /var/lib/apt/lists/*

COPY postgis.sh  /docker-entrypoint-initdb.d/postgis.sh
