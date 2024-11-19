#!/bin/bash

# Debian 12 gnome with standard utilities

# Remove some default home folders
rm -rf ~/Videos ~/Templates ~/Music ~/Public

# Update repositories and install main apps
sudo apt update
sudo apt upgrade

sudo apt install tmux neovim htop wget curl timeshift gdebi neofetch nala git flatpak haruna net-tools -y
# add blueman if xfce

# remove gnome games
sudo nala purge gnome-games -y
sudo nala autoremove

# Install build essential
sudo nala install build-essential dkms linux-headers-$(uname -r) -y

# Add microsoft fonts
sudo apt-add-repository contrib non-free -y
sudo nala install software-properties-common ttf-mscorefonts-installer -y

# Install restricted extras - non open source codecs 
sudo nala install libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y

# Add flatpak backup repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Neovim configuration: add line numbers and check syntax
mkdir ~/.config/nvim
echo "set number" >> ~/.config/nvim/init.vim
echo "syntax on" >> ~/.config/nvim/init.vim

# Install and configure firewall
sudo nala install ufw -y
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
# Using the above commands, all the incoming traffic except ssh is blocked. All outgoing traffic allowed.

# discord install
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo gdebi discord.deb
# install taskbar notification ?source

# spotify install
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo update && sudo nala install spotify-client -y

# install oh my zsh
# first install zsh
sudo nala install -y zsh
# change default shell to zsh then restart
chsh -s $(which zsh)
# download and install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# for themes that require powerline fonts
sudo nala install -y fonts-powerline
# restart terminal and apply changes
source ~/.zshrc

# install kali-like theme and 
wget -O ~/.oh-my-zsh/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme
# nvim ~/.zshrc
# Set ZSH_THEME="current_theme" to ZSH_THEME="kali-like" 
# restart terminal and apply changes
source ~/.zshrc

# Tmux plugin manager - https://github.com/tmux-plugins/tpm
# tmux resurrect to save and load sessions - https://github.com/tmux-plugins/tmux-resurrect?tab=readme-ov-file


# Optional

# fingerprint authentication https://wiki.debian.org/SecurityManagement/fingerprint%20authentication if laptop has a scanner - NOT the case on the current laptop
# sudo nala install fprintd libpam-fprintd
# then follow the instruction at Settings/User/Fingerprint Login

# nvidia install https://linuxconfig.org/how-to-install-nvidia-driver-on-debian-12-bookworm-linux
# sudo nala install nvidia-driver

# For the following apps I have not found a download API similar to discord
# so I am just adding the latest links here for reference

# Install Obsidian 
# wget "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/obsidian_1.7.7_amd64.deb" -O obsidian.deb 
# sudo gdebi obsidian.deb

# Install latest virtualbox
# wget "https://download.virtualbox.org/virtualbox/7.1.4/virtualbox-7.1_7.1.4-165100~Debian~bookworm_amd64.deb# -O virtualbox.deb
# sudo gdebi virtualbox.deb
