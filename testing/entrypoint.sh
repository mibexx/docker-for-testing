#!/bin/bash
set -e

ansible-playbook -i $ANSIBLE_DIR/inventory $PLAYBOOK_DIR/testing.yml
sudo -u postgres createdb docker

exec "$@"
