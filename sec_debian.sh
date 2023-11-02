#!/bin/bash
sudo nala update && sudo nala upgrade -y
sudo nala install gobuster openvpn nmap whatweb gdb 

# install metasploit
sudo apt update
sudo apt install curl wget gnupg2
#
# # seclists : https://github.com/danielmiessler/SecLists
# need to add a firewall rule to allow all traffic to tun0 in and out
# # issues for wordlists as they exist in kali - can't find reputable github page

# searchsploit https://www.exploit-db.com/searchsploit
# the msfconsole works from here: https://www.fosslinux.com/19213/how-to-install-metasploit-on-ubuntu.htm

# pwndbg - install by github https://github.com/pwndbg/pwndbg

# ghidra = run from ghidra run file once JDK latest is installed https://github.com/NationalSecurityAgency/ghidra
# 
