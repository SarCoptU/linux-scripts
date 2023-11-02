#!/bin/bash

# remove ~/Videos Templates Music Video

# add user to sudo group
	# sudo - root
	# usermod -aG sudo <username>

# 
sudo apt update
sudo apt upgrade

sudo apt install tmux vim htop timeshift gdebi neofetch nala git flatpak build-essential dkms linux-headers-$(uname -r) libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi 

# enable firewall
	# sudo apt install ufw -y
	# sudo ufw enable
	# sudo ufw default deny incoming
	# sudo ufw default allow outgoing
	# sudo ufw allow ssh
# Using above commands, we have blocked all the incoming traffic except ssh and allowed all outgoing traffic.

# discord install
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo nala install discord.deb

# fingerprint authentication https://wiki.debian.org/SecurityManagement/fingerprint%20authentication
