#!/bin/bash -eu +x

set -e
curl http://archive.zfsonlinux.org
if [ $? -ne 0 ];
then
  echo "archive.zfsonlinux.org doesn't appear to be available" && exit 1;
fi
yum localinstall -y --nogpgcheck http://archive.zfsonlinux.org/epel/zfs-release.el7.noarch.rpm
yum -y update kernel*
yum install -y kernel-devel zfs kexec-tools