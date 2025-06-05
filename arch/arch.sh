#!/bin/bash

# install xfce
sudo pacman -Syu xfce4 xfce4-goodies 

# install essential programs
sudo pacman -S firefox discord curl wget git github-cli zsh tmux nvim haruna tree stow bluez bluez-utils bluez-deprecated-tools 

# Thunar functionality - gnome virtual file system + flatpak
sudo pacman -S gvfs flatpak

# DM which works with xfce
sudo pacman -S lightdm lightdm-gtk-greeter

# fix for hybrid Nvidia/AMD gpus 
# it seems to work only with xfce for now
sudo pacman -S xf86-video-amdgpu vulkan-radeon mesa
sudo pacman -S nvidia nvidia-utils nvidia-prime

# font for hyprland
sudo pacman -S hyprland alacritty waybar wofi ttf-font-awesome powerline powerline-fonts

# enable LightDM 
sudo systemctl enable lightdm.service

# spotify/obsidian flatpak
flatpak install obsidian spotify

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
