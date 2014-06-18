#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -x /usr/bin/ansible ] || (
  # Install Ansible
  sudo apt-get install -y python-setuptools python-yaml python-jinja2 python-paramiko python-keyczar
  sudo easy_install pip
  sudo pip install ansible
)

cd $DIR/../ansible-playbooks

ansible-playbook -e master=true -K -i hosts setup.yml
