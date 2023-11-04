#!/bin/bash

# remove ~/Videos Templates Music
rm -rf ~/$USER/Videos ~/$USER/Templates ~/$USER/Music

sudo apt update
sudo apt upgrade

sudo apt install tmux neovim htop timeshift neofetch nala git wget curl gdebi

# discord install
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt install discord.deb

# fingerprint enable
# https://www.malibal.com/guides/how-to-enable-fingerprint-login-on-ubuntu/

# install docker

# install obsidian
# wget 'https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/obsidian_1.4.16_amd64.deb'
# chmod +x obsidian*.deb
# gdebi obsidian*.deb
