#!/bin/bash

# update the system and repos
sudo nala update && sudo apt upgrade -y

# install basic security tools
sudo nala install -y gobuster openvpn nmap whatweb gdb gnupg2 metasploit-framework exploitdb 

# install gdb and pwngdb plugin
sudo nala install -y gdb
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# install seclists
git clone https://github.com/danielmiessler/SecLists.git
# move seclists to /etc/share
