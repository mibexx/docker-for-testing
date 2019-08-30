FROM mibexx/docker-for-testing:php-73
MAINTAINER Mike Bertram <contact@mibexx.de>

ENV SPRYKER_DIR "/srv/release/spryker"

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
ONBUILD RUN vendor/bin/install -x jenkins-up -x jenkins-down
ONBUILD RUN chown -Rf www-data:www-data $SPRYKER_DIR/data
ONBUILD RUN ln -s $SPRYKER_DIR/public/Yves /srv/yves/www \
ONBUILD RUN ln -s $SPRYKER_DIR/public/Zed /srv/yves/www \
ONBUILD RUN ln -s $SPRYKER_DIR/public/Glue /srv/glue/www
