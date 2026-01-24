# Dotfiles

Personal macOS development environment configuration.

## Structure

- `Brewfile` — Homebrew packages and casks
- `bootstrap.sh` — Install everything and symlink configs
- `shell/` — zsh configuration (.zshrc, .zshenv, aliases)
- `git/` — Git configuration (.gitconfig)
- `scripts/` — Utility scripts (git-completion, etc.)
- `config/` — App configs (reserved for future use)

## Quick Start
```bash
bash ~/.dotfiles/bootstrap.sh
```

## What's installed

- zsh with syntax highlighting, git info prompt, fzf history search
- Node.js for JavaScript development
- Essential CLI tools: git, ripgrep, fzf, bat, eza, etc.
- Zed editor, iTerm2, Claude, 1Password
