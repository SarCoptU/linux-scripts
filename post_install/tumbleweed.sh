#!/bin/bash

# --- Exit On Error ---
# The 'set -e' command ensures that the script will exit immediately if any command fails,
# preventing a partially configured or broken system.
set -e

# --- Initial Setup ---
echo ":: Starting openSUSE Tumbleweed configuration..."

# It's generally safer to remove directories with a check.
# This script maintains your original command but makes it more robust by using the $HOME variable.
echo ":: Removing default user directories (Music, Public, Templates, Videos)..."
sudo rm -rf "$HOME/Public" "$HOME/Templates" "$HOME/Videos" "$HOME/Music"

# --- System Update ---
# For Tumbleweed, 'zypper ref' refreshes repositories and 'zypper dup' performs the distribution upgrade.
# Using '-n' or '--non-interactive' automates the process by accepting defaults.
echo ":: Refreshing repositories and updating system..."
sudo zypper --non-interactive ref
sudo zypper --non-interactive dup

# --- Install Essential Packages & Tools ---
# Consolidating package installations into a single command is more efficient.
# This group includes your window manager, terminal, and other development/system utilities.
echo ":: Installing essential applications and Hyprland components..."
sudo zypper --non-interactive install \
    git \
    curl \
    gh \
    wget \
    alacritty \
    zsh \
    haruna \
    waybar \
    hyprland \
    stow \
    tmux \
    neovim \
    wofi

# --- Install OPI and Multimedia Codecs ---
# OPI (OBS Package Installer) simplifies finding and installing packages from community repositories.
# The 'opi codecs' command is a common way to install all necessary multimedia codecs.
echo ":: Installing OPI and multimedia codecs..."
sudo zypper --non-interactive install opi
# Note: The 'opi codecs' command is interactive and will prompt you to select a vendor.
# This part of the script cannot be fully automated without more complex logic.
opi codecs

# --- Final Message ---
echo "✅ openSUSE Tumbleweed configuration complete!"
echo "Please reboot your system for all changes to take effect."


