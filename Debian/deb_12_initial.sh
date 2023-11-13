#!/bin/bash

# Remove some default home folders
rm -rf ~/Videos ~/Templates ~/Music ~/Public

# add user to sudo group
    # su -
    # usermod -aG sudo <username>
    # restart

# Update repositories and install main apps
sudo apt update
sudo apt upgrade

sudo apt install tmux neovim htop wget curl timeshift gdebi neofetch nala git flatpak haruna -y

# Install build essential
sudo nala install build-essential dkms linux-headers-$(uname -r) -y

# Add microsoft fonts
sudo apt-add-repository contrib non-free -y
sudo nala install software-properties-common ttf-mscorefonts-installer -y

# Install restricted extras - non open source codecs 
sudo nala install libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y

# Gnome manager for tweaking the desktop environment
sudo nala install gnome-shell-extension-manager -y

# Neovim configuration: add line numbers and check syntax
mkdir ~/.config/nvim
echo "set number" >> ~/.config/nvim/init.vim
echo "syntax on" >> ~/.config/nvim/init.vim

# Install and configure firewall
sudo nala install ufw -y
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
# Using the above commands, all the incoming traffic except ssh is blocked. All outgoing traffic allowed.

# discord install issues
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo gdebi discord.deb
# install taskbar notification ?source

# fingerprint authentication https://wiki.debian.org/SecurityManagement/fingerprint%20authentication

# install obsidian - needs some work similar to discord
	# wget 'https://github.com/obsidianmd/obsidian-releases/releases/download/v*.deb'
 # chmod +x obsidian*.deb
	# sudo gdebi obsidian*.deb

# install VMware, ?docker

# customization
