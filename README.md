# Dotfiles

Personal macOS (Apple Silicon) configuration.

## Structure

- `bootstrap.sh` — Symlinks configs into place (safe to re-run)
- `Brewfile` — Record of installed Homebrew packages, casks, and App Store apps (refresh with `brew bundle dump --file=~/.dotfiles/Brewfile --force --no-vscode`)
- `shell/` — zsh configuration (.zshrc, .zshenv, .zprofile, aliases, fzf)
- `git/` — Git configuration and global gitignore
- `scripts/` — git completion
- `config/` — App configs: Zed, gh, Ghostty, Hammerspoon, Claude Code (`settings.json`, status line)

## Quick Start
```bash
gh repo clone hildissent/dotfiles ~/.dotfiles
bash ~/.dotfiles/bootstrap.sh
```

## Shell setup

- zsh (Homebrew) with syntax highlighting, autosuggestions, fzf history/file search (via fd)
- eza, bat, zoxide, ripgrep, diff-so-fancy
- Terminal: Ghostty · Editor: Zed
- Double-tap Control toggles Ghostty's drop-down quick terminal (via Hammerspoon)
