#!/usr/bin/env bash

# Will show warning "dpkg-preconfigure: unable to re-open stdin: No such file or directory"
# The answers in https://serverfault.com/q/500764 don't work in MacOS
# It can be safely ignored

# We will use "Ansible local" provisioning
# See https://www.vagrantup.com/docs/provisioning/ansible_local.html
# Make sure Ansible is installed in the virtual machine
sudo apt-get install --assume-yes ansible

# Quick check
ansible --version
