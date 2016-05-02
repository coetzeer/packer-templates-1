#!/bin/bash -eu +x
yum install -y wget vim python-pip python-devel git openssl-devel
yum groupinstall -y "Development Tools"
pip install PyYAML jinja2 paramiko
cd ~
git clone https://github.com/ansible/ansible.git
cd ansible
git checkout v2.0.2.0-1
git submodule update --init --recursive
make install
rm -fr ~/ansible
