#!/bin/bash

# Del uninteresting folders
sudo rm -rf ~/Public ~/Templates ~/Videos ~/Music 

# Update the system
sudo zypper ref && sudo zypper dup 

# Install software
sudo zypper install git gh curl wget alacritty zsh haruna waybar hyprland hyprland-qtutils tmux nvim wofi 

# Install opi and codecs
sudo zypper install opi -y
opi codecs

# PDF simple splitter
# https://scarpetta.eu/pdfmixtool/#installation

# Change default shell to zsh then restart/logout
chsh -s $(which zsh)

# Download and install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
 
# Restart terminal and apply changes
source ~/.zshrc

# install kali-like theme and 
wget -O ~/.oh-my-zsh/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme
# nvim ~/.zshrc
# Set ZSH_THEME="current_theme" to ZSH_THEME="kali-like" 
# Restart terminal and apply changes
source ~/.zshrc
