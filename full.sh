#!/bin/bash

apt update -y
apt upgrade -y

# Install flatpak
apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

apt update -y

# Install apps
flatpak install -y flathub net.davidotek.pupgui2 org.onlyoffice.desktopeditors com.mattjakeman.ExtensionManager com.obsproject.Studio io.github.shiftey.Desktop com.discordapp.Discord com.valvesoftware.Steam

apt install vlc audacity btop gimp curl -y

#Chrome

### Nala ###
# Install Nala
apt install nala -y

# Config Nala
echo 'apt() {'  >> ~/.bashrc
echo   'command nala "$@"' >> ~/.bashrc
echo '}' >> ~/.bashrc
echo 'sudo() {' >> ~/.bashrc
echo   'if [ "$1" = "apt" ]; then' >> ~/.bashrc
echo     'shift' >> ~/.bashrc
echo     'command sudo nala "$@"' >> ~/.bashrc
echo   'else' >> ~/.bashrc
echo     'command sudo "$@"' >> ~/.bashrc
echo   'fi' >> ~/.bashrc
echo '}' >> ~/.bashrc
echo '' >> ~/.bashrc

nala fetch --auto -y

# Install Aliases
cp .bash_aliases ~/.bash_aliases

echo '' >> ~/.bashrc
echo 'if [ -f ~/.bash_aliases ]; then' >> ~/.bashrc
echo . /home/$USER/.bash_aliases >> ~/.bashrc
echo fi  >> ~/.bashrc
echo '' >> ~/.bashrc

# Move Dotfiles
git clone https://github.com/Maxyapper7/gnome-dotfiles.git
cp gnome-dotfiles/audacity ~/.config
cp gnome-dotfiles/GIMP ~/.config
cp gnome-dotfiles/nautilus ~/.config
cp gnome-dotfiles/neofetch ~/.config
cp gnome-dotfiles/variety ~/.config
cp gnome-dotfiles/btop ~/.config

# Install ZSH

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"