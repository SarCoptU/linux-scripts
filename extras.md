# Debian + Zsh 

### Linux Configuration Extras

This guide provides a collection of optional but useful configurations and software installations for various Linux distributions.

## 1. Zsh & Oh My Zsh Setup

This setup enhances your terminal experience with the Zsh shell and the Oh My Zsh framework. It is compatible with most Linux distributions.

## NOTE: Assuming zsh, curl and wget are already installed

### 1.2. Core Installation

1.  **Change Your Default Shell to Zsh**
    After running this command, you must log out and log back in for the change to take full effect.
    ```bash
    chsh -s $(which zsh)
    ```

2.  **Install Oh My Zsh**
    This command uses `curl` to download and run the official installation script.
    ```bash
    curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
    ```

### 1.2. Custom Theming (Example: Kali-Like)

1.  **Download the Theme File**
    This command uses `wget` to download the theme and place it in the Oh My Zsh themes directory.
    ```bash
    wget -O ~/.oh-my-zsh/custom/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme
    ```

2.  **Set the Theme in `.zshrc`**
    Open your Zsh configuration file with a text editor (e.g., `nvim`, `nano`, `vim`).
    ```bash
    nvim ~/.zshrc
    ```
    Find the line `ZSH_THEME="..."` and change it to:
    ```
    ZSH_THEME="kali-like"
    ```

3.  **Apply Changes**
    Reload your shell configuration for the new theme to appear.
    ```bash
    source ~/.zshrc
    ```

## 2. Debian 13 Specifics

These are tweaks and installations specific to Debian 13 "Trixie".

### Hardware & Drivers

* **NVIDIA Drivers**
    First, ensure the `contrib` and `non-free` repositories are enabled.
    ```bash
    sudo nala install nvidia-driver
    ```
    For a more detailed guide, see the [Debian Wiki on NVIDIA](https://wiki.debian.org/NvidiaGraphicsDrivers).

* **Fingerprint Authentication**
    For laptops with a fingerprint scanner.
    1.  Install the necessary packages:
        ```bash
        sudo nala install fprintd libpam-fprintd
        ```
    2.  Follow the setup instructions in `Settings > Users > Fingerprint Login`. See the [Debian Wiki on Fingerprint Auth](https://wiki.debian.org/SecurityManagement/fingerprint%20authentication) for more.


### Keyboard Layout

* **Swap Caps Lock and Left Control**
    Change the keyboard default file add option "ctrl:swapcaps"
    ```bash
    sudo nvim /etc/default/keyboard
    ```

### Tmux (Terminal Multiplexer)

* **TPM (Tmux Plugin Manager)**
    TPM simplifies managing Tmux plugins.
    * [TPM GitHub Repository](https://github.com/tmux-plugins/tpm)

* **Recommended Plugin: Tmux Resurrect**
    Saves and restores Tmux sessions across reboots.
    * [Tmux Resurrect GitHub Repository](https://github.com/tmux-plugins/tmux-resurrect)

## 3. **Misc**
* **Remove/create useful folders once logged-in as $USER**
    * Remove unused folders in $HOME
    ```bash
    rm -rf "$HOME/Music" "$HOME/Public" "$HOME/Templates" "$HOME/Videos"
    ```
    * Create folders for Sway config
    ```bash
    mkdir -p ~/.config/sway ~/.config/waybar ~/.config/wofi
    ```

