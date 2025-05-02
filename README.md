# linux_scripts
Scripts for Linux distros

**Debian 12 extras:**

- Tmux plugin manager
  - https://github.com/tmux-plugins/tpm - tmux resurrect to save and load sessions
  - https://github.com/tmux-plugins/tmux-resurrect?tab=readme-ov-file

- for KDE
  - sudo apt install plasma-discover-backend-flatpak
    
- If gnome
  - install gdebi in the initial apt install
 
- if xfce
  - install blueman for bluetooth

- Sometimes this work for swapping ctrl and caps lock on US layout
    - setxkbmap -layout us -option ctrl:swapcaps


- fingerprint authentication
   - https://wiki.debian.org/SecurityManagement/fingerprint%20authentication - if laptop has a scanner - NOT the case on the current laptop
   -  sudo nala install fprintd libpam-fprintd
   -  then follow the instruction at Settings/User/Fingerprint Login

- nvidia install https://linuxconfig.org/how-to-install-nvidia-driver-on-debian-12-bookworm-linux
   - sudo nala install nvidia-driver


- Install steam
  - https://wiki.debian.org/Steam

- install gnome app indicator
  - https://extensions.gnome.org/extension/615/appindicator-support/
