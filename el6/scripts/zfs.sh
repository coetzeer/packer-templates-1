#!/bin/bash -eu +x

set -e
curl http://archive.zfsonlinux.org > /dev/null
if [ $? -ne 0 ];
then
  echo "archive.zfsonlinux.org doesn't appear to be available" && exit 1;
fi
yum localinstall -y --nogpgcheck http://archive.zfsonlinux.org/epel/zfs-release.el6.noarch.rpm
yum install -y epel-release
yum install -y kernel-devel zfs kexec-tools
