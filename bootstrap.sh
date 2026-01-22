#!/bin/bash

set -e  # Exit on error

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔧 Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "🔗 Linking dotfiles..."
ln -sf "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/shell/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

echo "✅ Setup complete! Restart your terminal."
