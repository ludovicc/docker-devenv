#!/bin/sh

ansible-playbook -e master=true -K setup.yml
