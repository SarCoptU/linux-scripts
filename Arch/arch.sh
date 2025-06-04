#!/bin/bash

# install xfce
sudo pacman -Syu xfce4 xfce4-goodies 

# install essential programs
sudo pacman -S firefox curl wget git github-cli zsh tmux nvim haruna tree stow hyprland alacritty waybar wofi

# DM which works with xfce
sudo pacman -S lightdm lightdm-gtk-greeter

# fix for hybrid Nvidia/AMD gpus 
# it seems to work only with xfce for now
# but it might be ok for installing hyprland
sudo pacman -S xf86-video-amdgpu vulkan-radeon mesa

sudo pacman -S nvidia nvidia-utils nvidia-prime

# font for hyprland
sudo pacman -S ttf-font-awesome

# enable LightDM 
sudo systemctl enable lightdm.service


