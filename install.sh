#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo Hello, This is a post debian install script
echo Are you on a framework?
read -p 'y or n: ' frame
echo Do you have a Nvidia Card?
read -p 'y or n: ' nvidia
echo Do you want Full Or None?
read -p 'f, or n: ' packages
echo Do you want to remove most gnome apps?
read -p 'y, or n: ' gnomeapps

if [ $gnomeapps == 'y' ]
  then
  apt remove gnome-2048 aisleriot gnome-calendar gnome-characters gnome-chess gnome-clocks gnome-color-manager gnome-contacts baobab simple-scan evince gnome-documents evolution gnome-shell-extension-prefs five-or-more
fi
apt update -y
apt upgrade -y

if [ $frame == 'y' ]
  then
  bash framework.sh
fi

if [ $nvidia == 'y' ]
  then
  apt install nvidia-driver
fi

if [ $packages == 'f' ]
  then
  bash full.sh
fi



echo Done with install, please restart soon
  