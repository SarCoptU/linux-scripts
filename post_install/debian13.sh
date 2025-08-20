#!/usr/bin/env bash
# quick APT installer for Debian 13 + Sway
# usage: sudo ./quick_install.sh

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

# Update & handle any pending transitions so installs don't fail
apt-get update
apt-get -y full-upgrade
dpkg --configure -a || true
apt-get -y -f install || true

# Essentials & multimedia
apt-get install -y \
  build-essential dkms linux-headers-amd64 \
  git gh curl wget tmux neovim htop timeshift haruna net-tools flatpak stow amberol \
  libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi \
  fonts-powerline \
  ttf-mscorefonts-installer 

# Sway + Wayland tools + audio
apt-get install -y \
  alacritty \
  sway swaybg swayidle swayimg swaylock mako-notifier libnotify-bin \
  waybar wofi wl-clipboard grim slurp fonts-font-awesome \
  xdg-desktop-portal xdg-desktop-portal-wlr \
  pipewire pipewire-audio pipewire-pulse pipewire-alsa wireplumber \
  kanshi # useful for multiple desktops in wayland

# Steam install
dpkg --add-architecture i386
apt-get update
apt-get install -y steam-installer mesa-vulkan-drivers mesa-vulkan-drivers:i386 libglx-mesa0:i386 libgl1-mesa-dri:i386

# Install and configure the Uncomplicated Firewall (UFW).
apt install ufw -y
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable # 'yes' will be piped to the command to auto-confirm

# Flatpak install Discord, Spotify and Obsidian
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --noninteractive -y flathub com.discordapp.Discord
flatpak install --noninteractive -y flathub com.spotify.Client
flatpak install --noninteractive -y flathub md.obsidian.Obsidian

echo "✅ Done. You can start Sway with 'sway' (or log in via a Sway session)."
