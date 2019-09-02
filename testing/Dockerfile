FROM mibexx/docker-for-testing:php-73
MAINTAINER Mike Bertram <contact@mibexx.de>

ADD ansible $ANSIBLE_DIR

RUN composer global require hirak/prestissimo \
 && composer global require phpstan/phpstan codeception/codeception squizlabs/php_codesniffer phpmd/phpmd

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
