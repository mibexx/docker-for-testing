#!/bin/bash
set -e

ansible-playbook -i $ANSIBLE_DIR/inventory $PLAYBOOK_DIR/testing.yml
sudo -u postgres createdb docker

# Run your tests
[ -f $TESTING_BIN ] && bash $TESTING_BIN > $LOG_DIR/testing.log

exec "$@"
