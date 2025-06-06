#!/bin/bash

# --- Exit On Error ---
# The 'set -e' command ensures that the script will exit immediately if any command fails.
set -e

# --- System Update ---
# It's best practice to start with a full system upgrade.
echo ":: Synchronizing package databases and updating system..."
sudo pacman -Syu --noconfirm

# --- XFCE Desktop Environment ---
# Installs the base XFCE desktop and the 'goodies' pack which includes common plugins and utilities.
echo ":: Installing XFCE desktop environment..."
sudo pacman -S --noconfirm --needed xfce4 xfce4-goodies

# --- Display Manager (LightDM) ---
# LightDM is a lightweight and popular display manager that works well with XFCE.
echo ":: Installing and enabling LightDM..."
sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

# --- Essential Applications ---
# Consolidating package installation into a single command is more efficient.
# Using the --needed flag prevents re-installing packages that are already up-to-date.
echo ":: Installing essential applications..."
sudo pacman -S --noconfirm --needed firefox discord curl wget git github-cli zsh tmux nvim haruna tree stow gvfs flatpak

# --- Graphics Drivers for Hybrid GPUs (NVIDIA/AMD) ---
# This section installs drivers for a hybrid setup.
# Ensure you have identified your hardware correctly before running this.
echo ":: Installing graphics drivers for AMD/NVIDIA hybrid setup..."
# AMD components
sudo pacman -S --noconfirm --needed xf86-video-amdgpu vulkan-radeon mesa libva-mesa-driver mesa-vdpau
# NVIDIA components
sudo pacman -S --noconfirm --needed nvidia nvidia-utils nvidia-prime

# --- Hyprland Window Manager & Utilities ---
# Installs the Hyprland compositor and common tools used with it.
echo ":: Installing Hyprland and related tools..."
sudo pacman -S --noconfirm --needed hyprland alacritty waybar wofi ttf-font-awesome powerline powerline-fonts brightnessctl

# --- Bluetooth Support ---
# Installs Bluez for Bluetooth functionality.
echo ":: Installing Bluetooth services..."
sudo pacman -S --noconfirm --needed bluez bluez-utils
sudo systemctl enable bluetooth.service

# --- Flatpak Applications ---
# Installs applications from Flathub.
# The --noninteractive flag is used for scripting.
echo ":: Installing Flatpak applications (Spotify & Obsidian)..."
flatpak install --noninteractive flathub com.spotify.Client
flatpak install --noninteractive flathub md.obsidian.Obsidian

# --- Final Message ---
echo "✅ Arch Linux configuration complete!"
echo "Please reboot your system for all changes to take effect."


