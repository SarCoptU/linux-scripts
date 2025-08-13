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
sudo pacman -S --noconfirm --needed firefox discord curl wget git github-cli zsh tmux nvim haruna tree stow pdfmixtool gvfs flatpak yt-dlp

# --- Graphics Drivers for Hybrid GPUs (NVIDIA/AMD) ---
echo ":: Detecting GPU setup..."

# Detect GPUs
HAS_AMD=$(lspci | grep -i 'VGA' | grep -i 'AMD')
HAS_NVIDIA=$(lspci | grep -i 'VGA\|3D' | grep -i 'NVIDIA')

# Install drivers based on detected GPUs
if [[ -n "$HAS_AMD" && -n "$HAS_NVIDIA" ]]; then
    echo ":: AMD + NVIDIA hybrid detected — installing hybrid drivers..."

    # AMD drivers
    sudo pacman -S --needed xf86-video-amdgpu vulkan-radeon mesa libva-mesa-driver mesa-vdpau

    # NVIDIA drivers
    sudo pacman -S --needed nvidia nvidia-utils nvidia-prime

elif [[ -n "$HAS_AMD" ]]; then
    echo ":: AMD GPU detected — installing AMD drivers..."

    sudo pacman -S --needed xf86-video-amdgpu vulkan-radeon mesa libva-mesa-driver mesa-vdpau

elif [[ -n "$HAS_NVIDIA" ]]; then
    echo ":: NVIDIA GPU detected — installing NVIDIA drivers..."

    sudo pacman -S --needed nvidia nvidia-utils

else
    echo ":: No supported AMD or NVIDIA GPUs detected — skipping graphics driver installation."
fi

# --- Hyprland Window Manager & Utilities ---
# Installs the Hyprland compositor and common tools used with it.
echo ":: Installing Hyprland and related tools..."
sudo pacman -S --noconfirm --needed hyprland hyprshot swaync alacritty waybar wofi ttf-font-awesome powerline powerline-fonts brightnessctl

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


