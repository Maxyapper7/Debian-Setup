#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#Update and Upgrade System
sudo apt update -y
sudo apt upgrade -y

#Install & Config Nala
sudo apt install Nala -y
sudo nala fetch --auto

sudo nala install 
sudo echo "apt() { command nala "$@"} sudo() {if [ "$1" = "apt" ]; then shift command sudo nala "$@" else command sudo "$@" fi}" >> ~/.bashrc
sudo echo "apt() { command nala "$@"} sudo() {if [ "$1" = "apt" ]; then shift command sudo nala "$@" else command sudo "$@" fi}" >> /root/.bashrc

#Install Flatpak
sudo nala install flatpak
sudo nala install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Install Programs
flatpak install flathub com.obsproject.Studio com.valvesoftware.Steam net.davidotek.pupgui2 com.visualstudio.code com.discordapp.Discord net.lutris.Lutris com.usebottles.bottles us.zoom.Zoom org.onlyoffice.desktopeditors org.videolan.VLC com.github.muriloventuroso.easyssh -y
flatpak install flathub com.google.Chrome org.mozilla.firefox org.polymc.PolyMC -y

echo "Done With Instalation Please Reboot"
