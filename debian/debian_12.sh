#!/bin/bash

# Debian 12 kde with standard utilities

# Remove some default home folders
rm -rf ~/Videos ~/Templates ~/Music ~/Public

# Update repositories and install main apps
sudo apt update
sudo apt upgrade

sudo apt install tmux neovim htop wget curl timeshift neofetch nala git flatpak haruna net-tools -y

# Install build essential
sudo nala install build-essential dkms linux-headers-$(uname -r) -y

# Add microsoft fonts
sudo apt-add-repository contrib non-free -y
sudo nala install software-properties-common ttf-mscorefonts-installer -y

# Install restricted extras - non open source codecs 
sudo nala install libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y

# Add flatpak backup repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install and configure firewall
sudo nala install ufw -y
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
# Using the above commands, all the incoming traffic except ssh is blocked. All outgoing traffic allowed.

# discord, spotify install
flatpak install discord
flatpak install spotify

# for themes that require powerline fonts
sudo nala install -y fonts-powerline

# Install steam https://wiki.debian.org/Steam
sudo dpkg --add-architecture i386
sudo nala update -y
sudo nala install steam-installer
sudo nala install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
