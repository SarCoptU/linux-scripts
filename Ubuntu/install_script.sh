#!/bin/bash

# Remove some default home folders
rm -rf ~/Videos ~/Templates ~/Music ~/Public

# Update repositories and install main apps
sudo apt update
sudo apt upgrade

sudo apt install tmux neovim htop wget curl timeshift gdebi neofetch nala git flatpak haruna net-tools -y

# Add microsoft fonts
sudo apt-add-repository contrib non-free -y
sudo apt install software-properties-common ttf-mscorefonts-installer -y

# Neovim configuration: add line numbers and check syntax
# mkdir ~/.config/nvim
# echo "set number" >> ~/.config/nvim/init.vim
# echo "syntax on" >> ~/.config/nvim/init.vim

# discord install
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo gdebi discord.deb

# install oh my zsh
# fist install zsh
sudo apt install -y zsh
# change default shell to zsh then restart
chsh -s $(which zsh)
# download and install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# for themes that require powerline fonts
sudo apt install -y fonts-powerline
# restart terminal and apply changes
source ~/.zshrc

# install kali-like theme and 
wget -O ~/.oh-my-zsh/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme
nvim ~/.zshrc
# Set ZSH_THEME="current_theme" to ZSH_THEME="kali-like" 

# restart terminal and apply changes
source ~/.zshrc

# VS code install from https://code.visualstudio.com/docs/setup/linux
sudo apt install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

