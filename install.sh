#!/bin/bash
#Update and Upgrade System
sudo apt update -y
sudo apt upgrade -y

#Install & Config Nala
sudo apt isntall Nala -y
sudo nala fetch --auto

sudo nala install 
sudo echo "apt() { command nala "$@"} sudo() {if [ "$1" = "apt" ]; then shift command sudo nala "$@" else command sudo "$@" fi}" >> ~/.bashrc
sudo echo "apt() { command nala "$@"} sudo() {if [ "$1" = "apt" ]; then shift command sudo nala "$@" else command sudo "$@" fi}" >> /root/.bashrc

#Install Flatpak
sudo nala install flatpak
sudo nala install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Install Programs
sudo nala install steam discord firefox openoffice gnome-tweaks  -y
flatpak install flathub com.obsproject.Studio -y

echo "Done With Instalation Please Reboot"