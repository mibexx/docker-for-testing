#!/bin/bash
set -e

ansible-playbook -i $ANSIBLE_DIR/inventory $PLAYBOOK_DIR/testing.yml

echo "Create database"
sudo -u postgres createdb docker

# Run your tests
[ -f $TESTING_BIN ] && echo "Start testing log into: $LOG_DIR" && bash $TESTING_BIN > $LOG_DIR/testing.log

echo "Done.. starting ssh-server.."
exec "$@"
