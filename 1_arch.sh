#!/bin/bash

# install xfce
sudo pacman -Syu --noconfirm xfce4 xfce4-goodies 

# install essential programs
sudo pacman -S --noconfirm firefox discord curl wget git github-cli zsh tmux nvim haruna tree stow 

# Thunar functionality - gnome virtual file system + flatpak
sudo pacman -S --noconfirm gvfs flatpak

# DM which works with xfce
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter

# fix for hybrid Nvidia/AMD gpus 
# it seems to work only with xfce for now
sudo pacman -S --noconfirm xf86-video-amdgpu vulkan-radeon mesa
sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-prime

# hyprland tweaks
sudo pacman -S --noconfirm hyprland alacritty waybar wofi ttf-font-awesome powerline powerline-fonts bluez bluez-utils bluez-deprecated-tools brightnessctl 


# enable LightDM 
sudo systemctl enable lightdm.service

# spotify/obsidian flatpak
flatpak install obsidian spotify
