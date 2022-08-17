#!/bin/bash

#Update and Upgrade System
sudo apt update -y
sudo apt upgrade -y

#Install Nala
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg

sudo apt isntall Nala -y

#Config Nala
sudo nala fetch --auto
