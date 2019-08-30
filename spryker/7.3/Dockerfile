FROM mibexx/docker-for-testing:php-73
MAINTAINER Mike Bertram <contact@mibexx.de>

ENV SPRYKER_DIR "/srv/release/spryker"

ENV APPLICATION_ENV "development"
ENV APPLICATION_STORE "DE"
ENV RABBITMQ_VHOST_COL "/DE_development_zed"
ENV RABBITMQ_VHOST_COL_USER "guest"
ENV RABBITMQ_VHOST_COL_PASS "guest"
ENV JENKINS_SERVER "127.0.0.1"
ENV ES_SERVER "127.0.0.1"
ENV REDIS_SESSION_SERVER "127.0.0.1"
ENV REDIS_DATA_SERVER "127.0.0.1"
ENV RABBITMQ_SERVER "127.0.0.1"
ENV POSTGRESQL_SERVER "127.0.0.1"
ENV RABBITMQ_ADMIN_USER "guest"
ENV RABBITMQ_ADMIN_PW "guest"
ENV POSTGRESQL_USER "docker"
ENV POSTGRESQL_PW "docker"
ENV YVES_DOMAIN "www.de.suite.local"
ENV ZED_DOMAIN "zed.de.suite.local"
ENV GLUE_DOMAIN "glue.de.suite.local"

RUN composer global require hirak/prestissimo \
 && mkdir -p /srv/zed \
 && mkdir -p /srv/yves \
 && mkdir -p /srv/glue \
 && mkdir -p $SPRYKER_DIR

ADD vhost /etc/nginx/sites-enabled

WORKDIR $SPRYKER_DIR

ONBUILD RUN /etc/init.d/redis-server start
ONBUILD RUN /etc/init.d/rabbitmq-server start
ONBUILD RUN /etc/init.d/elasticsearch start
ONBUILD RUN /etc/init.d/postgresql start
ONBUILD RUN /etc/init.d/nginx start
ONBUILD RUN /etc/init.d/php7.3-fpm start
ONBUILD ADD . $SPRYKER_DIR
ONBUILD RUN composer install --prefer-dist
ONBUILD RUN ln -s $SPRYKER_DIR/public/Yves /srv/yves/www
ONBUILD RUN ln -s $SPRYKER_DIR/public/Zed /srv/yves/www
ONBUILD RUN ln -s $SPRYKER_DIR/public/Glue /srv/glue/www
