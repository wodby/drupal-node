FROM node:alpine

ENV GOTLP_VER 0.1.5
ENV GOTPL_URL https://github.com/wodby/gotpl/releases/download/${GOTLP_VER}/gotpl-alpine-linux-amd64-${GOTLP_VER}.tar.gz
ENV DRUPAL_NODEJS_VER 1.0

RUN set -ex && \
    mkdir -p /var/www/html && \

    apk add --no-cache ca-certificates curl bash make wget && \

    wget -qO- ${GOTPL_URL} | tar xz -C /usr/local/bin && \

    cd /var/www/html && \
    npm install drupal-node.js@~${DRUPAL_NODEJS_VER}

EXPOSE 8080

WORKDIR /var/www/html/node_modules/drupal-node.js/

COPY nodejs.config.js.tpl /etc/gotpl/
COPY actions /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "app.js"]
