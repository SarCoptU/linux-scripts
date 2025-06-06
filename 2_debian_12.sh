#!/bin/bash

# --- Exit On Error ---
# The 'set -e' command ensures that the script will exit immediately if any command fails,
# preventing a partially configured system.
set -e

# --- Initial Setup ---
echo ":: Starting Debian 12 configuration..."

# It's generally safer to remove directories with a check or by using xdg-user-dirs to manage them.
# For this script, we'll keep your original commands but add a note of caution.
echo ":: Removing default user directories (Music, Public, Templates, Videos)..."
rm -rf "$HOME/Music" "$HOME/Public" "$HOME/Templates" "$HOME/Videos"

# --- System Update and Upgrade ---
# First, update package lists and upgrade existing packages using nala.
echo ":: Updating package lists and upgrading system..."
sudo nala update
sudo nala upgrade -y

# --- Enable Additional Repositories (contrib, non-free) ---
# Install software-properties-common first, then add the repositories.
# This is necessary for packages like Microsoft fonts and certain codecs.
echo ":: Enabling 'contrib' and 'non-free' repositories..."
sudo nala install software-properties-common -y
sudo apt-add-repository contrib non-free -y
sudo nala update

# --- Install Essential Packages & Tools ---
# Consolidating package installations into fewer commands is more efficient.
# This includes development tools, system utilities, multimedia codecs, and fonts.
echo ":: Installing essential packages, build tools, and multimedia support..."
sudo nala install -y \
    build-essential \
    dkms \
    linux-headers-$(uname -r) \
    git \
    curl \
    wget \
    tmux \
    neovim \
    htop \
    timeshift \
    neofetch \
    haruna \
    net-tools \
    flatpak \
    ttf-mscorefonts-installer \
    libavcodec-extra \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-vaapi \
    fonts-powerline

# --- Firewall Configuration (UFW) ---
# Install and configure the Uncomplicated Firewall (UFW).
echo ":: Setting up the firewall..."
sudo nala install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable # 'yes' will be piped to the command to auto-confirm

# --- Steam Installation ---
# Enable i386 architecture and install Steam along with its dependencies.
echo ":: Installing Steam..."
sudo dpkg --add-architecture i386
sudo nala update
sudo nala install -y \
    steam-installer \
    mesa-vulkan-drivers \
    libglx-mesa0:i386 \
    mesa-vulkan-drivers:i386 \
    libgl1-mesa-dri:i386

# --- Flatpak Setup and Application Installation ---
# Add the Flathub remote repository and install applications.
echo ":: Setting up Flatpak and installing applications (Discord & Spotify)..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --noninteractive -y flathub com.discordapp.Discord
flatpak install --noninteractive -y flathub com.spotify.Client

# --- Final Message ---
echo "✅ Debian 12 configuration complete!"
echo "Please reboot your system for all changes to take effect."


