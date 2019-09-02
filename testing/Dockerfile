FROM mibexx/docker-for-testing:php-73
MAINTAINER Mike Bertram <contact@mibexx.de>

ADD ansible $ANSIBLE_DIR
ENV BASE_DIR "/data/docker/testing"
ENV TESTING_BIN "$BASE_DIR/docker-for-testing"
ENV LOG_DIR "/data/docker/logs"

RUN composer global require hirak/prestissimo \
 && composer global require phpstan/phpstan codeception/codeception squizlabs/php_codesniffer phpmd/phpmd

RUN mkdir -p $BASE_DIR \
 && mkdir -p $LOG_DIR

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR $BASE_DIR

VOLUME $BASE_DIR
VOLUME $LOG_DIR
