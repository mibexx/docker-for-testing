FROM mibexx/docker-for-testing:php-73
MAINTAINER Mike Bertram <contact@mibexx.de>

ENV SPRYKER_DIR "/srv/release/spryker"

RUN composer global require hirak/prestissimo \
 && mkdir -p /srv/zed \
 && mkdir -p /srv/yves \
 && mkdir -p /srv/glue \
 && mkdir -p $SPRYKER_DIR \
 && ln -s $SPRYKER_DIR/public/Yves /srv/yves/www \
 && ln -s $SPRYKER_DIR/public/Zed /srv/yves/www \
 && ln -s $SPRYKER_DIR/public/Glue /srv/glue/www

ADD vhost /etc/nginx/sites-enabled

WORKDIR $SPRYKER_DIR

ONBUILD ADD . $SPRYKER_DIR
ONBUILD RUN composer install --prefer-dist
ONBUILD RUN vendor/bin/install -x jenkins-up -x jenkins-down
