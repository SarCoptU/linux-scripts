#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install gobuster openvpn nmap whatweb gdb gnupg2

# install metasploit - one way is to enable kali repos, install needed apps and disable
  # never apt upgrade while kali repos active

# learn a bit about gnupg https://www.redhat.com/sysadmin/getting-started-gpg

# # seclists : https://github.com/danielmiessler/SecLists
# need to add a firewall rule to allow all traffic to tun0 in and out
# # issues for wordlists as they exist in kali - can't find reputable github page

# searchsploit https://www.exploit-db.com/searchsploit

# pwndbg - install by github https://github.com/pwndbg/pwndbg

# ghidra = run from ghidra run file once JDK latest is installed https://github.com/NationalSecurityAgency/ghidra
