# Extras

## zhs/oh my zsh install

- Change default shell to zsh then restart/logout
`chsh -s $(which zsh)`

- Download and install oh my zsh
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

- Restart terminal and apply changes
`source ~/.zshrc`

- install kali-like theme
`wget -O ~/.oh-my-zsh/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme`

#### open zsh settings to change theme

`nvim ~/.zshrc`

Set ZSH_THEME="current_theme" to ZSH_THEME="kali-like" 

Restart terminal to apply changes
`source ~/.zshrc`
