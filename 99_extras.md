Linux Configuration Extras

This guide provides a collection of optional but useful configurations and software installations for various Linux distributions.
1. Zsh & Oh My Zsh Setup

This setup enhances your terminal experience with the Zsh shell and the Oh My Zsh framework. It is compatible with most Linux distributions.
1.1. Prerequisites: Installing Zsh & Utilities

First, you need to install zsh and some common utilities (curl, wget) if they aren't already on your system. Open your terminal and use the command corresponding to your distribution:

    For Debian / Ubuntu / Linux Mint:
    Bash

sudo apt update && sudo apt install zsh curl wget -y

For Arch Linux / Manjaro:
Bash

sudo pacman -Syu --noconfirm --needed zsh curl wget

For Fedora / CentOS / RHEL:
Bash

sudo dnf install zsh curl wget -y

For openSUSE:
Bash

    sudo zypper install zsh curl wget

1.2. Core Installation

    Change Your Default Shell to Zsh
    After running this command, you must log out and log back in for the change to take full effect.
    Bash

chsh -s $(which zsh)

Install Oh My Zsh
This command uses curl to download and run the official installation script.
Bash

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

1.3. Custom Theming (Example: Kali-Like)

    Download the Theme File
    This command uses wget to download the theme and place it in the Oh My Zsh themes directory.
    Bash

wget -O ~/.oh-my-zsh/custom/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme

Set the Theme in .zshrc
Open your Zsh configuration file with a text editor (e.g., nvim, nano, vim).
Bash

nvim ~/.zshrc

Find the line ZSH_THEME="..." and change it to:

ZSH_THEME="kali-like"

Apply Changes
Reload your shell configuration for the new theme to appear.
Bash

    source ~/.zshrc

2. Debian 12 Specifics

These are tweaks and installations specific to Debian 12 "Bookworm".
Hardware & Drivers

    NVIDIA Drivers
    First, ensure the contrib and non-free repositories are enabled.
    Bash

sudo nala install nvidia-driver

For a more detailed guide, see the Debian Wiki on NVIDIA.

Fingerprint Authentication
For laptops with a fingerprint scanner.

    Install the necessary packages:
    Bash

        sudo nala install fprintd libpam-fprintd

        Follow the setup instructions in Settings > Users > Fingerprint Login. See the Debian Wiki on Fingerprint Auth for more.

Desktop Environment Extras

    For KDE Plasma:
    Install the Flatpak backend for the Discover software center.
    Bash

sudo apt install plasma-discover-backend-flatpak

For GNOME:

    Install gdebi for easier local .deb package installation.
    Bash

    sudo apt install gdebi

    Install the AppIndicator extension for tray icons from third-party apps. GNOME Extensions: AppIndicator Support

For XFCE:
Install blueman for a full-featured Bluetooth manager.
Bash

    sudo apt install blueman

Keyboard Layout

    Swap Caps Lock and Left Control This command temporarily remaps the keys for the current session. For a permanent change, you'll need to configure it in your desktop environment's settings or an Xorg configuration file.
    Bash

    setxkbmap -layout us -option ctrl:swapcaps

Tmux (Terminal Multiplexer)

    TPM (Tmux Plugin Manager)
    TPM simplifies managing Tmux plugins.
        TPM GitHub Repository

    Recommended Plugin: Tmux Resurrect
    Saves and restores Tmux sessions across reboots.
        Tmux Resurrect GitHub Repository

3. Useful Cross-Platform Applications

    Steam (for Gaming)
    The Debian Wiki for Steam provides the most reliable and up-to-date installation instructions.

    PDF Mix Tool (for PDF Editing)
    A simple and effective application for merging, splitting, and editing PDF files.
        Official Website & Installation Guide
