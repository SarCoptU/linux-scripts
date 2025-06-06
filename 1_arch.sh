#!/bin/bash

# install xfce
sudo pacman -Syu xfce4 xfce4-goodies 

# install essential programs
sudo pacman -S firefox discord curl wget git github-cli zsh tmux nvim haruna tree stow 

# Thunar functionality - gnome virtual file system + flatpak
sudo pacman -S gvfs flatpak

# DM which works with xfce
sudo pacman -S lightdm lightdm-gtk-greeter

# fix for hybrid Nvidia/AMD gpus 
# it seems to work only with xfce for now
sudo pacman -S xf86-video-amdgpu vulkan-radeon mesa
sudo pacman -S nvidia nvidia-utils nvidia-prime

# font for hyprland
sudo pacman -S hyprland alacritty waybar wofi ttf-font-awesome powerline powerline-fonts bluez bluez-utils bluez-deprecated-tools 


# enable LightDM 
sudo systemctl enable lightdm.service

# spotify/obsidian flatpak
flatpak install obsidian spotify
