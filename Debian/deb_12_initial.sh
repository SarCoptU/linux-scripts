#!/bin/bash

# Remove some default home folders
rm -rf ~/Videos ~/Templates ~/Music ~/Public

# Update repositories and install main apps
sudo apt update
sudo apt upgrade

sudo apt install tmux neovim htop wget curl timeshift gdebi neofetch nala git flatpak haruna net-tools -y

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

# discord install
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo gdebi discord.deb
# install taskbar notification ?source

# fingerprint authentication https://wiki.debian.org/SecurityManagement/fingerprint%20authentication
sudo nala install fprintd libpam-fprintd
# then follow the instruction at Settings/User/Fingerprint Login

# install oh my zsh
# fist install zsh
sudo nala install -y zsh
# change default shell to zsh then restart
chsh -s $(which zsh)
# download and install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# for themes that require powerline fonts
sudo nala install -y fonts-powerline
# restart terminal and apply changes
source ~/.zshrc

# VS code install from https://code.visualstudio.com/docs/setup/linux
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

# install obsidian - instruction on https://obsidian.md/download

# install VMware from https://www.vmware.com/products/workstation-player/workstation-player-evaluation.html

# alternatively install virtualbox
