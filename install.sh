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