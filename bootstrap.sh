#!/bin/bash
# Symlink dotfiles into place. Safe to re-run.
# (Software is installed manually; Brewfile is a record, not run here.)

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    mkdir -p "$(dirname "$2")"
    ln -sfn "$DOTFILES_DIR/$1" "$2"
    echo "  $2 -> $1"
}

echo "🔗 Linking dotfiles..."
link shell/.zshrc                      "$HOME/.zshrc"
link shell/.zshenv                     "$HOME/.zshenv"
link shell/.zprofile                   "$HOME/.zprofile"
link shell/.fzf.zsh                    "$HOME/.fzf.zsh"
link git/.gitconfig                    "$HOME/.gitconfig"
link config/zed/settings.json          "$HOME/.config/zed/settings.json"
link config/gh/config.yml              "$HOME/.config/gh/config.yml"
link config/claude/settings.json       "$HOME/.claude/settings.json"
link config/claude/statusline-command.sh "$HOME/.claude/statusline-command.sh"
link config/claude/CLAUDE.md            "$HOME/.claude/CLAUDE.md"
link config/ghostty/config             "$HOME/.config/ghostty/config"
link config/hammerspoon/init.lua       "$HOME/.config/hammerspoon/init.lua"
link config/mise/config.toml           "$HOME/.config/mise/config.toml"
link config/npm/npmrc                  "$HOME/.config/npm/npmrc"
link config/gem/gemrc                  "$HOME/.config/gem/gemrc"
link config/irb/irbrc                  "$HOME/.config/irb/irbrc"

# Standard directories for code and web content
mkdir -p "$HOME/Developer" "$HOME/Sites"

# Point Hammerspoon at ~/.config instead of ~/.hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

echo "✅ Done. Open a new terminal window."
