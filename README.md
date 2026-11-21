# Dotfiles

Personal macOS (Apple Silicon) configuration.

## Structure

- `bootstrap.sh` — Symlinks configs into place (safe to re-run)
- `Brewfile` — Record of installed Homebrew packages, casks, and App Store apps (refresh with `brew bundle dump --file=~/.dotfiles/Brewfile --force --no-vscode`)
- `shell/` — zsh configuration (.zshrc, .zshenv, .zprofile, aliases, fzf)
- `git/` — Git configuration and global gitignore
- `scripts/` — git completion
- `config/` — App configs: Zed, gh, Ghostty, Hammerspoon, mise, npm, gem, irb, Claude Code (`settings.json`, `CLAUDE.md`, status line)

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

## Languages

[mise](https://mise.jdx.dev) manages Node (LTS) + pnpm, Ruby, Go, and uv. uv manages Python
(`uv python install --default`). After bootstrap on a new Mac:
```bash
mise install && uv python install --default
```
Projects pin versions with `mise use <tool>@<version>` (writes `mise.toml`).

## Keeping ~ clean

`shell/.zshenv` sets XDG base dirs and points npm, Python, Ruby/Bundler, Go, and less history/cache
files into `~/.config`, `~/.cache`, `~/.local/share`, and `~/.local/state`.
Code projects live in `~/Developer`, web content in `~/Sites`.
