#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

clear
echo Hello, This is a post debian install script
echo
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
  apt-get -qq autoclean && apt-get -qq purge -y gnome-2048 gnome-games gnome-sudoku gnome-sushi gnome-chess gnome-contacts gnome-mahjongg gnome-mines gnome-maps gnome-nibbles gnome-online-miners gnome-documents swell-foop shotwell gnome-klotski gnome-robots gnome-taquin hitori five-or-more four-in-a-row aisleriot lightsoff quadrapassel tali gnome-tetravex;
apt-get -qq remove -y libgnome-games-support-* libmusicbrainz* shotwell-common;
fi
apt update -y
apt upgrade -y

if [ $frame == 'y' ]
  then
  bash framework.sh
fi

if [ $nvidia == 'y' ]
  then
  apt install nvidia-driver -y
fi

if [ $packages == 'f' ]
  then
  bash full.sh
fi

clear
echo Done with install, please restart soon
  
