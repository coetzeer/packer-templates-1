#!/bin/bash -eu +x
#yum install -y wget vim python-pip python-devel git openssl-devel python-lxml python-jinja2 python-paramiko python-yaml
#yum groupinstall -y "Development Tools"
cd ~
git clone https://github.com/ansible/ansible.git
cd ansible
git checkout v2.0.1.0-1
git submodule update --init --recursive
make install

#test
mkdir /etc/ansible
echo "localhost ansible_connection=local" > /etc/ansible/hosts
ansible all -m setup
if [ $? -ne 0 ];
then
    echo "Failed to test ansible" && exit 1
fi
rm -fr /etc/ansible/hosts