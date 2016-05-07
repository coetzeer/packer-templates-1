#!/usr/bin/env bash
yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso

# Fix network configuration
if [ -f /etc/sysconfig/network-scripts/ifcfg-enp0s3 ];
then
    sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-enp0s3
    sed -i /UUID/d /etc/sysconfig/network-scripts/ifcfg-enp0s3
    sed -ie "s/enp0s3/eth0/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
    mv /etc/sysconfig/network-scripts/ifcfg-enp0s3 /etc/sysconfig/network-scripts/ifcfg-eth0
    rm /etc/sysconfig/network-scripts/ifcfg-enp0s3e
fi