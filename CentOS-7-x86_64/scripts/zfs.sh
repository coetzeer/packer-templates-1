#!/bin/bash -eu +x
DEVICE=sda

set -e
curl http://archive.zfsonlinux.org
if [ $? -ne 0 ];
then
  echo "archive.zfsonlinux.org doesn't appear to be available" && exit 1;
fi
yum localinstall -y --nogpgcheck http://archive.zfsonlinux.org/epel/zfs-release.el7.noarch.rpm
yum -y update kernel*
yum install -y kernel-devel zfs kexec-tools
latestkernel=`ls -t /boot/vmlinuz-* | sed "s/\/boot\/vmlinuz-//g" | head -n1`
runningkernel=`uname -r`
#
#echo "latestkernel = $latestkernel and runningkernel = $runningkernel"
#
#
#_partitions=`lsblk -l | grep ${DEVICE} | wc -l`
#if [ _partitions -ne 1 ]; then
#  >&2 echo "Device ${DEVICE} appears to have partions already"
#  exit -1;
#fi
#
#if [ "$latestkernel" != "$runningkernel" ];
#then
#  #http://blog.agate.io/post/16460518079/running-new-linux-kernel-without-rebooting
#  kexec -l /boot/vmlinuz-${latestkernel} --initrd=/boot/initramfs-${latestkernel}.img --append="`cat /proc/cmdline`"
#  kexec -e
#fi
#
#dkms install spl/0.6.5.5
#dkms install zfs/0.6.5.5
#systemctl restart systemd-modules-load.service
#systemctl start zfs-import-cache.service zfs-mount.service zed.service
#zpool create u02 ${DEVICE} -f
#
#zfs create u02/.nfsroot
#zfs create u02/.nfsroot/apps
#zfs create u02/.nfsroot/data
#zfs create u02/.nfsroot/logs
#
#mkdir -p /u02/.nfsroot/apps
#mkdir -p /u02/.nfsroot/logs
#mkdir -p /u02/.nfsroot/data
#
##http://blog.briankoopman.com/zfs-automated-snapshots/
##https://github.com/zfsonlinux/zfs-auto-snapshot
#cd ~
#https://github.com/zfsonlinux/zfs-auto-snapshot.git
#cd zfs-auto-snapshot
#make install
#
#zfs set com.sun:auto-snapshot=false u02/.nfsroot
#zfs set com.sun:auto-snapshot=true u02/.nfsroot/logs
#zfs set com.sun:auto-snapshot=true u02/.nfsroot/apps
#zfs set com.sun:auto-snapshot=true u02/.nfsroot/data
#
##systemctl enable zfs-auto-snapshot-hourly.timer
