#!/bin/bash

set -e  # Exit on error

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔧 Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "🔗 Linking dotfiles..."
ln -sf "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/shell/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES_DIR/shell/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/config/.npmrc" "$HOME/.npmrc"
ln -sf "$DOTFILES_DIR/config/.gemrc" "$HOME/.gemrc"

# XDG config directory links
mkdir -p "$HOME/.config/zed" "$HOME/.config/gh"
ln -sf "$DOTFILES_DIR/config/zed/settings.json" "$HOME/.config/zed/settings.json"
ln -sf "$DOTFILES_DIR/config/gh/config.yml" "$HOME/.config/gh/config.yml"

echo "✅ Setup complete! Restart your terminal."
