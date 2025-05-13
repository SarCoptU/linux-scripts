#!/bin/bash

# Update the system
sudo pacman -Syu

# Install software
sudo pacman -S git curl wget kitty zsh haruna waybar hyprland tmux nvim

# Change default shell to zsh then restart
chsh -s $(which zsh)

# Download and install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

