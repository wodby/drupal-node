FROM node:8-alpine

ENV GOTLP_VER="0.1.5"

ARG DRUPAL_NODE_VER

RUN set -ex; \
    \
    apk add --no-cache ca-certificates curl bash make wget; \
    \
    url="https://github.com/wodby/gotpl/releases/download/${GOTLP_VER}/gotpl-alpine-linux-amd64-${GOTLP_VER}.tar.gz"; \
    wget -qO- "${url}" | tar xz -C /usr/local/bin; \
    \
    mkdir -p /usr/src/app; \
    cd /usr/src/app; \
    npm install drupal-node.js@~${DRUPAL_NODE_VER}; \
    \
    rm -rf /var/cache/apk/*

EXPOSE 8080

WORKDIR /usr/src/app/node_modules/drupal-node.js/

COPY templates /etc/gotpl/
COPY bin /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "app.js"]
