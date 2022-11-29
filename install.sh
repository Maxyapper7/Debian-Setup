#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo Hello, This is a debain install
echo Are you on a framework?
read -p 'y or n: ' frame
echo Do you have a Nvidia Card? '('Note only works for current GeForce/Quadro/Tesla models')'
read -p 'y or n: ' nvidia
echo Do you want Full Or None?
read -p 'f, or n: ' packages
echo Do you want sid '(unstable)' debain?
read -p 'y, or n: ' branch



if [ $frame == 'y' ]
  then
  bash framework.sh
fi

if [ $nvidia == 'y' ]
  then
  sudo bash nvidia.sh
fi

if [ $packages == 'f' ]
  then
  sudo bash full.sh
fi

if [ $branch == 'y' ]
  then
  sudo bash branch.sh
fi

echo Done with install, please restart soon
  