#!/bin/bash

# Remove some default home folders
rm -rf ~/Videos ~/Templates ~/Music ~/Public

# Update repositories and install main apps
sudo apt update
sudo apt upgrade

sudo apt install tmux neovim htop wget curl timeshift gdebi neofetch nala git flatpak haruna net-tools -y

# Add microsoft fonts
sudo apt install software-properties-common ttf-mscorefonts-installer -y

# Neovim configuration: add line numbers and check syntax
mkdir ~/.config/nvim
echo "set number" >> ~/.config/nvim/init.vim
echo "syntax on" >> ~/.config/nvim/init.vim

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

