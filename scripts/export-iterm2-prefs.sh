#!/bin/bash
# Re-exports current iTerm2 preferences into the dotfiles repo.
# Run this before a reinstall (or after tweaking iTerm2 settings) to keep the snapshot current.
set -e
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
defaults export com.googlecode.iterm2 "$DOTFILES_DIR/config/iterm2/com.googlecode.iterm2.plist"
echo "✅ Exported iTerm2 preferences to config/iterm2/com.googlecode.iterm2.plist"
