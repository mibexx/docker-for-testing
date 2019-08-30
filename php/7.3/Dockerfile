FROM mibexx/docker-for-testing:environment
MAINTAINER Mike Bertram <contact@mibexx.de>

ADD ansible $ANSIBLE_DIR

RUN ansible-playbook -i $ANSIBLE_DIR/inventory $PLAYBOOK_DIR/php/play.yml

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
