# Dotfiles

Personal macOS development environment configuration.

## Structure

- `Brewfile` — Homebrew packages and casks
- `bootstrap.sh` — Install everything and symlink configs
- `shell/` — zsh configuration (.zshrc, .zshenv, aliases)
- `git/` — Git configuration (.gitconfig)
- `scripts/` — Utility scripts (git-completion, secret filters, iTerm2 export, etc.)
- `config/` — App configs: Zed, gh, Claude Code (`settings.json`, `mcp_servers.json`), iTerm2 preferences

## Secrets

Files containing API keys (currently Zed and Claude Code configs, both embedding an Obsidian API key)
use a git clean/smudge filter (`filter=secrets` in `.gitattributes`) so the real key is stripped before
committing and restored on checkout from `.secrets` (untracked, local only). See `scripts/clean-secrets.sh`
and `scripts/smudge-secrets.sh`.

## iTerm2 preferences

`config/iterm2/com.googlecode.iterm2.plist` is a snapshot of iTerm2's preferences, restored via
`defaults import` in `bootstrap.sh`. It's a point-in-time export, not live-synced — run
`scripts/export-iterm2-prefs.sh` to refresh it before a reinstall or after changing iTerm2 settings.

## Quick Start
```bash
bash ~/.dotfiles/bootstrap.sh
```

## What's installed

- zsh with syntax highlighting, git info prompt, fzf history search
- Node.js for JavaScript development
- Essential CLI tools: git, ripgrep, fzf, bat, eza, etc.
- Zed editor, iTerm2, Claude, 1Password
