#!/bin/bash
# options:
# --no-update : skip updating the Docker images from Internet

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ansible-playbooks
if [ "$1" == "--no-update" ]; then
  ansible-playbook -K -e master=true --skip-tags=update build.yml
else
  ansible-playbook -K -e master=true build.yml
fi
