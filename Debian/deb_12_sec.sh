#!/bin/bash

# update the system and repos
sudo apt update && sudo apt upgrade -y

# install basic security tools
sudo apt install -y gobuster openvpn nmap whatweb gdb gnupg2 exploitdb

# install gdb and pwngdb plugin
sudo apt install -y gdb
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# install seclists
git clone https://github.com/danielmiessler/SecLists.git
sudo mv  ./SecLists /usr/share
