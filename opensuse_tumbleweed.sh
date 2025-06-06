#!/bin/bash

# Del uninteresting folders
sudo rm -rf ~/Public ~/Templates ~/Videos ~/Music 

# Update the system
sudo zypper ref && sudo zypper dup 

# Install software
sudo zypper install git curl gh wget alacritty zsh haruna waybar hyprland hyprland-qtutils stow tmux nvim wofi 

# Install opi and codecs
sudo zypper install opi
opi codecs
