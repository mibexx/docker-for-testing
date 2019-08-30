#!/bin/bash
set -e

/etc/init.d/redis-server start
/etc/init.d/rabbitmq-server start
/etc/init.d/elasticsearch start
/etc/init.d/postgresql start
/etc/init.d/nginx start
/etc/init.d/php7.3-fpm start

exec "$@"
