#!/bin/bash

#Easyemwm dependency grabber/installer
#author: cameronos
#date: 11/14/2025

#script installs all dependencies, tries to build emwm from source on Debian-type distros
#could be modified for any distro, just convert the apt installs to whatever package manager has these on your system

set -e
echo "Updating package list.."
sudo apt update

echo "Installing build tools"
sudo apt install -y build-essential cmake automake autoconf libtool pkg-config

echo "Installing x11 development libraries"
sudo apt install -y libx11-dev libxt-dev libxext-dev libxrandr-dev libxinerama-dev

echo "Installing Xorg and some apps, if haven't already"
sudo apt install -y xorg x11-apps xterm

echo "Installing Motif/OpenMotif development libraries"
sudo apt install -y libmotif-dev libxm4

echo "Installing helpful tools for grabbing repo"
sudo apt install -y git curl


echo "Cloning repo.."
git clone https://github.com/alx210/emwm.git

echo "Proceeding into dir, making and hopefully running"
cd emwm
sudo make install

clear
sleep 1
echo "Install finished. Attempting to start DE. Exit by going into different tty"
sleep 1
xterm &
startx /usr/bin/emwm
