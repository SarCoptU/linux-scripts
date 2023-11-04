#!/bin/bash

# remove ~/Videos Templates Music
rm -rf ~/Videos ~/Templates ~/Music

# add user to sudo group
	# su -
	# usermod -aG sudo <username>
 	# restart

# 
sudo apt update
sudo apt upgrade

sudo apt install tmux nvim htop wget curl timeshift gdebi neofetch nala git flatpak build-essential dkms linux-headers-$(uname -r) libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi gnome-shell-extension-manager

# install/enable firewall
sudo nala install ufw -y
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
# Using above commands, we have blocked all the incoming traffic except ssh and allowed all outgoing traffic.

# discord install
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo nala install discord.deb

# install taskbar notification ?site
# fingerprint authentication https://wiki.debian.org/SecurityManagement/fingerprint%20authentication

# install obsidian
# wget 'https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/obsidian_1.4.16_amd64.deb'
# chmod +x obsidian*.deb
# gdebi obsidian*.deb
