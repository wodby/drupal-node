#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

gotpl "/etc/gotpl/nodejs.config.js.tpl" > "/usr/src/app/node_modules/drupal-node.js/nodejs.config.js"

if [[ "${1}" == 'make' ]]; then
    exec "${@}" -f /usr/local/bin/actions.mk
else
    exec "${@}"
fi
