#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

check_rq() {
    drush rq --format=json | jq '.[] | select(.title=="'"${1}"'") | .value' | grep -q "${2}"
    echo "OK"
}

composer require drupal/nodejs

cd ./web

drush si -y --db-url="${DB_DRIVER}://${DB_USER}:${DB_PASSWORD}@${DB_HOST}/${DB_NAME}"

sudo files_chmod /mnt/files/config/sync_dir

drush en nodejs -y
drush -y config-set nodejs.config nodejs.host "${NODE_HOST}"
drush -y config-set nodejs.config service_key "${NODE_SERVICE_KEY}"

echo -n "Checking node.js connection... "
check_rq "Node.js" "The Node.js server was successfully reached."