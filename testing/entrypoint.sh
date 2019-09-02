#!/bin/bash
set -e

ansible-playbook -i $ANSIBLE_DIR/inventory $PLAYBOOK_DIR/testing.yml

echo "Create database"
sudo -u postgres createdb docker

# Run your tests
echo "Start testing log into: $LOG_DIR"
[ -f $TESTING_BIN ] && bash $TESTING_BIN > $LOG_DIR/testing.log

exec "$@"
