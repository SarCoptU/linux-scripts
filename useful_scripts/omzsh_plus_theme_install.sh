#!/usr/bin/env bash
set -euo pipefail

# === Zsh + Oh My Zsh + Theme Automator =========================================
# This script installs Zsh (if needed), sets it as your default shell, installs
# Oh My Zsh unattended, applies a theme, and (optionally) common plugins.
#
# Usage:
#   bash zsh_install.sh
#   bash zsh_install.sh --no-plugins           # skip autosuggestions & syntax highlighting
#   THEME=kali-like bash zsh_install.sh        # pick a theme name (must exist or be downloaded below)
#
# Notes:
# - Safe to re-run; it is idempotent.
# - Does NOT auto-start a new shell; log out/in (or run: exec zsh) after running.
# =============================================================================

THEME="${THEME:-kali-like}"
INSTALL_PLUGINS=1
if [[ "${1:-}" == "--no-plugins" ]]; then
  INSTALL_PLUGINS=0
fi

info()  { printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
warn()  { printf "\033[1;33m[WARN]\033[0m %s\n" "$*"; }
error() { printf "\033[1;31m[ERR]\033[0m %s\n" "$*" >&2; }

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || { error "Missing required command: $1"; exit 1; }
}

# --- 0) Requirements -----------------------------------------------------------
need_cmd curl
need_cmd wget
need_cmd sed
need_cmd awk
need_cmd grep

# --- 1) Install Zsh if missing -------------------------------------------------
if ! command -v zsh >/dev/null 2>&1; then
  info "Zsh not found. Attempting to install (Debian/Ubuntu: apt)."
  if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y zsh
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y zsh
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -S --noconfirm zsh
  else
    error "Package manager not supported. Install zsh manually and re-run."
    exit 1
  fi
else
  info "Zsh already installed: $(zsh --version)"
fi

# --- 2) Set default shell to zsh -----------------------------------------------
CURRENT_SHELL="$(getent passwd "$USER" | awk -F: '{print $7}')"
ZSH_PATH="$(command -v zsh)"
if [[ "$CURRENT_SHELL" != "$ZSH_PATH" ]]; then
  info "Changing default shell to: $ZSH_PATH"
  chsh -s "$ZSH_PATH" || warn "Could not change shell automatically. You may need to run: chsh -s $(which zsh)"
else
  info "Default shell already set to zsh."
fi

# --- 3) Install Oh My Zsh (unattended) ----------------------------------------
export RUNZSH=no CHSH=no KEEP_ZSHRC=yes
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  info "Installing Oh My Zsh (unattended)."
  # Use plain URL (no markdown brackets!) to avoid zsh 'unknown file attribute: h' errors.
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  info "Oh My Zsh already present."
fi

# --- 4) Backup or create ~/.zshrc ---------------------------------------------
ZSHRC="$HOME/.zshrc"
if [[ -f "$ZSHRC" && ! -f "$ZSHRC.bak" ]]; then
  cp "$ZSHRC" "$ZSHRC.bak"
  info "Backed up existing .zshrc to .zshrc.bak"
fi
if [[ ! -f "$ZSHRC" ]]; then
  info "Creating a fresh ~/.zshrc"
  cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$ZSHRC"
fi

# --- 5) Install/Activate theme -------------------------------------------------
THEMES_DIR="$HOME/.oh-my-zsh/custom/themes"
mkdir -p "$THEMES_DIR"

# If user picked 'kali-like', fetch it if missing
if [[ "$THEME" == "kali-like" ]]; then
  THEME_FILE="$THEMES_DIR/kali-like.zsh-theme"
  if [[ ! -f "$THEME_FILE" ]]; then
    info "Downloading 'kali-like' theme."
    wget -qO "$THEME_FILE" https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme
  else
    info "'kali-like' theme already installed."
  fi
fi

# Ensure ZSH_THEME is set properly in ~/.zshrc
if grep -q '^ZSH_THEME=' "$ZSHRC"; then
  sed -i "s|^ZSH_THEME=.*|ZSH_THEME=\"${THEME}\"|g" "$ZSHRC"
else
  echo "ZSH_THEME=\"${THEME}\"" >> "$ZSHRC"
fi
info "Theme set to: $THEME"

# --- 6) Optional plugins -------------------------------------------------------
if [[ "$INSTALL_PLUGINS" -eq 1 ]]; then
  info "Installing common plugins: zsh-autosuggestions, zsh-syntax-highlighting"

  # autosuggestions
  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
  else
    (cd "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" && git pull --ff-only) || true
  fi

  # syntax highlighting
  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  else
    (cd "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" && git pull --ff-only) || true
  fi

  # enable plugins in .zshrc (idempotent)
  if grep -q '^plugins=' "$ZSHRC"; then
    # replace entire plugins=(...) line with a sane default set
    sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$ZSHRC"
  else
    printf "\nplugins=(git zsh-autosuggestions zsh-syntax-highlighting)\n" >> "$ZSHRC"
  fi
else
  info "Skipping plugin installation (per flag)."
fi

# --- 7) Quality-of-life options ------------------------------------------------
append_if_missing() {
  local line="$1"
  grep -qxF "$line" "$ZSHRC" || echo "$line" >> "$ZSHRC"
}

append_if_missing "set -o vi"            # or remove if you prefer emacs mode
append_if_missing "export EDITOR=nvim"   # or vim/nano
append_if_missing "export VISUAL=\$EDITOR"

# Source zshrc to apply changes for current shell (if already in zsh)
if [[ -n "${ZSH_VERSION:-}" ]]; then
  # shellcheck disable=SC1090
  source "$ZSHRC" || true
fi

cat <<'EOT'

All set! Next steps:
- Log out and back in, or run: exec zsh
- If your terminal starts in bash, ensure your login shell is Zsh:  chsh -s "$(which zsh)"
- To change theme later: set ZSH_THEME="name" in ~/.zshrc, then: source ~/.zshrc

EOT
