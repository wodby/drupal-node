#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

check_rq() {
    # TODO: remove COLUMNS=0 with drush 8.1.17 travis_release.sh
    # see https://github.com/drush-ops/drush/issues/3410
    COLUMNS=0 drush rq --format=json | jq ".\"${1}\".value" | grep -q "${2}"
    echo "OK"
}

composer require drupal/nodejs

cd ./web

drush si -y --db-url="${DB_DRIVER}://${DB_USER}:${DB_PASSWORD}@${DB_HOST}/${DB_NAME}"
drush en nodejs -y
drush -y vset nodejs_server_host "${NODE_HOST}"
drush -y vset nodejs_service_key "${NODE_SERVICE_KEY}"

echo -n "Checking node.js connection... "
check_rq "nodejs" "The Drupal-Node.js server (version 1.0.*) was successfully reached."