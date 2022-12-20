#!/bin/bash

#Install Fingerprint Reader
apt install fprintd libpam-fprintd

clear
echo Please tic the box that says Fingerprint authentication Then exit
read -p 'Press any key'

pam-auth-update

#Mic
echo "options snd-hda-intel model=dell-headset-multi" | sudo tee -a /etc/modprobe.d/alsa-base.conf

#Brightness Keys
echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash module_blacklist=hid_sensor_hub"' >> /etc/default/grub

sudo update-grub

#Scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

#Tap to Click
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Power Settings
apt install powertop intel-media-va-driver intel-gpu-tools -y

powertop --auto-tune

sudo systemctl enable powertop

echo PCIE_ASPM_ON_BAT=powersupersave >> /etc/tlp.conf