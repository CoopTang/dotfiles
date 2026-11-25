#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

# Install GNU Stow if missing
if ! command -v stow &> /dev/null; then
    echo "Installing GNU Stow..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install stow
    elif [ -f /etc/arch-release ]; then
        sudo pacman -S --noconfirm stow
    elif [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install -y stow
    fi
fi

# Backup existing conflicting files
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
for file in .bashrc .bash_profile .zshrc .gitconfig; do
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$HOME/$file" "$BACKUP_DIR/"
        echo "Backed up existing $file to $BACKUP_DIR"
    fi
done

# Stow packages
cd "$DOTFILES_DIR"
stow -v bash zsh git

echo "Dotfiles successfully stowed!"