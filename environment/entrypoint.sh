#!/bin/bash
set -e

/etc/init.d/redis-server start
/etc/init.d/rabbitmq-server start
/etc/init.d/elasticsearch start
/etc/init.d/postgresql start

exec "$@"
