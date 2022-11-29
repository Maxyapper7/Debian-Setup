#!/bin/bash

apt update -y
apt upgrade -y

# Install flatpak
apt install flatpak -y
apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

# Install apps
flatpak install -y flathub org.polymc.PolyMC com.github.muriloventuroso.easyssh net.davidotek.pupgui2 org.onlyoffice.desktopeditors us.zoom.Zoom com.mattjakeman.ExtensionManager com.obsproject.Studio io.github.shiftey.Desktop

apt install vlc audacity filezilla btop

#Steam
wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
apt install ./steam.deb

#Discord
apt install ./discord.deb

#Chrome


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

echo 'apt() {'  >> /root/.bashrc
echo   'command nala "$@"' >> /root/.bashrc
echo '}' >> /root/.bashrc
echo 'sudo() {' >> /root/.bashrc
echo   'if [ "$1" = "apt" ]; then' >> /root/.bashrc
echo     'shift' >> /root/.bashrc
echo     'command sudo nala "$@"' >> /root/.bashrc
echo   'else' >> /root/.bashrc
echo     'command sudo "$@"' >> /root/.bashrc
echo   'fi' >> /root/.bashrc
echo '}' >> /root/.bashrc
echo '' >> /root/.bashrc


# Install Aliases
mv .bash_aliases ~/.bash_aliases

echo 'if [ -f ~/.bash_aliases ]; then' >> .bashrc
echo . /home/max/.bash_aliases >> .bashrc
echo fi  >> .bashrc
echo '' >> .bashrc