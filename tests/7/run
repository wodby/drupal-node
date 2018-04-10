#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

docker-compose up -d
docker-compose exec node make check-ready max_try=10 -f /usr/local/bin/actions.mk
docker-compose exec mariadb make check-ready max_try=12 wait_seconds=5 -f /usr/local/bin/actions.mk
docker-compose exec --user=root drupal apk add --update jq
docker-compose exec drupal make init -f /usr/local/bin/actions.mk
docker-compose exec drupal tests
docker-compose down
