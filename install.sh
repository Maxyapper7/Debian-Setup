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
  apt purge aisleriot baobab cheese eog evince evolution file-roller firefox-esr five-or-more four-in-a-row gedit gnome-2048 gnome-calculator gnome-calendar gnome-characters gnome-chess gnome-clocks gnome-color-manager gnome-contacts gnome-disk-utility gnome-documents gnome-font-viewer gnome-klotski gnome-logs gnome-mahjongg gnome-maps gnome-mines gnome-music gnome-nibbles gnome-robots gnome-screenshot gnome-software gnome-sound-recorder gnome-shell-extension-prefs gnome-sudoku gnome-system-monitor gnome-taquin gnome-tetravex gnome-todo gnome-tweaks gnome-weather hitori iagno im-config libreoffice-calc libreoffice-common libreoffice-draw libreoffice-impress libreoffice-writer lightsoff malcontent nautilus quadrapassel rhythmbox seahorse shotwell simple-scan software-properties-gtk swell-foop synaptic tali totem transmission-gtk yelp 
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
  
