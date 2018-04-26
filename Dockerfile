ARG BASE_IMAGE_TAG

FROM wodby/node:${BASE_IMAGE_TAG}

ARG DRUPAL_NODE_VER

ENV NODE_PORT 8080

RUN set -ex; \
    \
    npm install "drupal-node.js@~${DRUPAL_NODE_VER}"

EXPOSE 8080

WORKDIR /usr/src/app/node_modules/drupal-node.js/

COPY templates /etc/gotpl/
COPY docker-entrypoint-init.d /docker-entrypoint-init.d/

CMD ["node", "app.js"]
