#!/bin/bash

# Clear current repositories
echo '' > /etc/apt/sources.list 

# Add sid repositories
echo Types: deb deb-src > /etc/apt/sources.list.d/debian.sources
echo URIs: https://mirrors.wikimedia.org/debian/ >> /etc/apt/sources.list.d/debian.sources
echo Suites: unstable experimental >> /etc/apt/sources.list.d/debian.sources
echo Components: main contrib non-free >> /etc/apt/sources.list.d/debian.sources

# Update System
echo Updating System
echo This may take a long 'time'
apt update
apt dist-upgrade