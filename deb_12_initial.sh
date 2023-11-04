#!/bin/bash

# remove ~/Videos Templates Music
rm -rf ~/Videos ~/Templates ~/Music ~/Public

# add user to sudo group
	# su -
	# usermod -aG sudo <username>
 	# restart

# install main apps
sudo apt update
sudo apt upgrade

sudo apt install -y tmux neovim htop wget curl timeshift gdebi neofetch nala git flatpak 

# install build essentials
sudo nala build-essential dkms linux-headers-$(uname -r) 

# install restricted extras - non open source codecs and microsoft fonts
sudo nala install ttf-mscorefonts-installer libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi

# install gnome manager
sudo nala install gnome-shell-extension-manager

# install/enable firewall
sudo nala install ufw -y
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
# Using above commands, we have blocked all the incoming traffic except ssh and allowed all outgoing traffic.

# discord install issues
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo gdebi discord.deb
# install taskbar notification ?source

# fingerprint authentication https://wiki.debian.org/SecurityManagement/fingerprint%20authentication

# install obsidian - needs some work similar to discord
	# wget 'https://github.com/obsidianmd/obsidian-releases/releases/download/v*.deb'
 	# chmod +x obsidian*.deb
	# sudo gdebi obsidian*.deb
