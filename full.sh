#!/bin/bash

apt update -y
apt upgrade -y

# Install flatpak
apt install flatpak -y
apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install apps
flatpak install -y flathub org.polymc.PolyMC com.github.muriloventuroso.easyssh net.davidotek.pupgui2 org.onlyoffice.desktopeditors us.zoom.Zoom com.mattjakeman.ExtensionManager com.obsproject.Studio io.github.shiftey.Desktop com.discordapp.Discord

apt install vlc audacity btop -y

#Steam
wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
apt install ./steam.deb -y

#Chrome

### Nala ###
# Install Nala
apt install nala -y

# Config Nala
echo 'apt() {'  >> .bashrc
echo   'command nala "$@"' >> .bashrc
echo '}' >> .bashrc
echo 'sudo() {' >> .bashrc
echo   'if [ "$1" = "apt" ]; then' >> .bashrc
echo     'shift' >> .bashrc
echo     'command sudo nala "$@"' >> .bashrc
echo   'else' >> .bashrc
echo     'command sudo "$@"' >> .bashrc
echo   'fi' >> .bashrc
echo '}' >> .bashrc
echo '' >> .bashrc

nala fetch --auto

# Install Aliases
cp .bash_aliases ~/.bash_aliases

echo '' >> .bashrc
echo 'if [ -f ~/.bash_aliases ]; then' >> .bashrc
echo . /home/max/.bash_aliases >> .bashrc
echo fi  >> .bashrc
echo '' >> .bashrc

# Move Dotfiles
#git clone https://github.com/Maxyapper7/gnome-dotfiles.git

