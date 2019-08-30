FROM mibexx/docker-for-testing:spryker-73
MAINTAINER Mike Bertram <contact@mibexx.de>

#ENV APPLICATION_ENV "development"
#ENV APPLICATION_STORE "DE"
#ENV RABBITMQ_VHOST_COL "/DE_development_zed"
#ENV RABBITMQ_VHOST_COL_USER "guest"
#ENV RABBITMQ_VHOST_COL_PASS "guest"
#ENV JENKINS_SERVER "127.0.0.1"
#ENV ES_SERVER "127.0.0.1"
#ENV REDIS_SESSION_SERVER "127.0.0.1"
#ENV REDIS_DATA_SERVER "127.0.0.1"
#ENV RABBITMQ_SERVER "127.0.0.1"
#ENV POSTGRESQL_SERVER "127.0.0.1"
#ENV RABBITMQ_ADMIN_USER "guest"
#ENV RABBITMQ_ADMIN_PW "guest"
#ENV POSTGRESQL_USER "docker"
#ENV POSTGRESQL_PW "docker"
#ENV YVES_DOMAIN "www.de.suite.local"
#ENV ZED_DOMAIN "zed.de.suite.local"
#ENV GLUE_DOMAIN "glue.de.suite.local"

RUN vendor/bin/install -x jenkins-up -x jenkins-down
RUN chown -Rf www-data:www-data $SPRYKER_DIR/data
