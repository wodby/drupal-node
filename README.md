# Server app for Drupal node.js integration module 

[![Build Status](https://travis-ci.org/wodby/drupal-node.svg?branch=master)](https://travis-ci.org/wodby/drupal-node)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/drupal-node.svg)](https://hub.docker.com/r/wodby/drupal-node)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/drupal-node.svg)](https://hub.docker.com/r/wodby/drupal-node)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Overview

Server app [beejeebus/drupal-nodejs](https://github.com/beejeebus/drupal-nodejs) for the [Node.js Integration Drupal module](https://www.drupal.org/project/nodejs)

For generic node image please see [wodby/node](https://github.com/wodby/node).

## Docker Images

!!! For better reliability we release images with stability tags (`wodby/drupal-node:1.0-X.X.X`) which correspond to [git tags](https://github.com/wodby/drupal-node/releases). We **STRONGLY RECOMMEND** using images only with stability tags. 

About images:

* All images are based on Alpine Linux
* Base image: [wodby/node](https://github.com/wodby/node)
* [Travis CI builds](https://travis-ci.org/wodby/drupal-node) 
* [Docker Hub](https://hub.docker.com/r/wodby/drupal-node) 

Supported tags and respective `Dockerfile` links:

* `1`, `1.0`, `latest` [_(Dockerfile)_](https://github.com/wodby/drupal-node/tree/master/Dockerfile)

## Environment variables 

| Variable                             | Default Value     | Description |
| ------------------------------------ | ----------------- | ----------- |
| `NODE_BACKEND_BASE_PATH`             |                   |             |
| `NODE_BACKEND_HOST`                  | `php`             |             |
| `NODE_BACKEND_PORT`                  | `80`              |             |
| `NODE_BACKEND_SCHEME`                | `http`            |             |
| `NODE_BASE_AUTH_PATH`                |                   |             |
| `NODE_CLIENTS_CAN_WRITE_TO_CLIENTS`  | `false`           |             |
| `NODE_CLIENTS_CAN_WRITE_TO_CHANNELS` | `false`           |             |
| `NODE_DEBUG`                         | `1`               |             |
| `NODE_JS_ETAG`                       | `true`            |             |
| `NODE_JS_MINIFICATION`               | `true`            |             |
| `NODE_LOG_LEVEL`                     | `1`               |             |
| `NODE_MESSAGE_PATH`                  | `/nodejs/message` |             |
| `NODE_RESOURCE`                      | `/socket.io`      |             |
| `NODE_SCHEME`                        | `http`            |             |
| `NODE_SERVICE_KEY`                   |                   |             |
| `NODE_SSL_CA_PATH`                   |                   |             |
| `NODE_SSL_CERT_PATH`                 |                   |             |
| `NODE_SSL_KEY_PATH`                  |                   |             |

## Complete Drupal stack

See [Docker4Drupal](https://github.com/wodby/docker4drupal)
