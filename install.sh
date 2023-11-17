#!/bin/bash

apt install -y git wget curl make vim mc

mkdir /opt/mackbook -p && cd /opt/mackbook

## wifi

wget https://github.com/Dunedan/mbp-2016-linux/files/4974264/brcmfmac43602-pcie.txt
cp ./brcmfmac43602-pcie.txt /lib/firmware/brcm/
rm brcmfmac43602-pcie.txt

## keyboard

apt install -y brightnessctl
brightnessctl -l
brightnessctl --device='spi::kbd_backlight' s 150

## sound

apt install -y linux-source-6.2.0
apt install -y gcc linux-headers-generic patch
git clone https://github.com/davidjo/snd_hda_macbookpro.git && cd snd_hda_macbookpro/
./install.cirrus.driver.sh

## battery life
apt install indicator-cpufreq
sed -i 's/^#HandleSuspendKey=.*$/HandleSuspendKey=suspend-then-hibernate/' /etc/systemd/sleep.conf
sed -i 's/^#AllowSuspendThenHibernate=.*$/AllowSuspendThenHibernate=yes/' /etc/systemd/sleep.conf
sed -i 's/^HibernateDelaySec=.*$/HybridSleepMode=3600/' /etc/systemd/sleep.conf

## touch bar
# no solution :(

## webcam
# no solution :(
#
# draft script:
#
# apt install -y cpio kmod libssl-dev checkinstall
# git clone https://github.com/patjak/facetimehd-firmware.git && cd facetimehd-firmware
# make
# make install
# cd ..
# depmod
# modprobe facetimehd
# sudo echo "facetimehd" >> /etc/modules-load.d/facetimehd.conf

## end

rm -rf /opt/mackbook

reboot
