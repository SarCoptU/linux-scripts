#!/bin/bash

# remove unessential home directories
sudo rm -rf ~/Desktop ~/Templates ~/Videos 

# install xfce
sudo pacman -Syu xfce xfce-goodies 

# install essential programs
sudo pacman -S curl wget git gh zsh tmux nvim haruna stow hyprland hyprland-utils alacritty waybar wofi

# DM which works with xfce
sudo pacman -S lightdm lightdm-gtk-greeter

# fix for hybrid Nvidia/AMD gpus 
# it seems to work only with xfce for now
# but it might be ok for installing hyprland
sudo pacman -S xf86-video-amdgpu vulkan-radeon mesa

sudo pacman -S nvidia nvidia-utils nvidia-prime

# enable LightDM 
sudo systemctl enable lightdm.service

