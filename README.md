# Dotfiles

Personal macOS (Apple Silicon) configuration.

## Structure

- `bootstrap.sh` — Symlinks configs into place (safe to re-run)
- `Brewfile` — Record of installed Homebrew packages, casks, and App Store apps (refresh with `brew bundle dump --file=~/.dotfiles/Brewfile --force --no-vscode && sed -i '' '/^go "/d' ~/.dotfiles/Brewfile`)
- `shell/` — zsh configuration (.zshrc, .zshenv, .zprofile, aliases, fzf)
- `git/` — Git configuration and global gitignore
- `scripts/` — git completion
- `config/` — App configs: Zed, gh, Ghostty, Hammerspoon, mise, npm, gem, irb, Claude Code (`settings.json`, `CLAUDE.md`, status line)

## Quick Start
On a new Mac (the repo must live at `~/.dotfiles`; paths in the shell and git config assume it).
Run the steps in order, and open a new terminal only after step 5.

1. `xcode-select --install`
2. Install [Homebrew](https://brew.sh)
3. `git clone https://github.com/hildissent/dotfiles.git ~/.dotfiles`
4. Sign in to the App Store, then `brew bundle --file=~/.dotfiles/Brewfile`
5. `bash ~/.dotfiles/bootstrap.sh`
6. In a new terminal: `mise install && uv python install --default`
7. `gh auth login && gh auth setup-git`
8. Grant Hammerspoon Accessibility permission and sign in to Claude Code, 1Password, etc.

## Manually installed software

Not available through Homebrew or the App Store, so it isn't in the Brewfile:

- [Foundry Virtual Tabletop](https://foundryvtt.com) — licensed; download the macOS build from the Foundry site

## Shell setup

- zsh (Homebrew) with syntax highlighting, autosuggestions, fzf history/file search (via fd)
- eza, bat, zoxide, ripgrep, diff-so-fancy
- Terminal: Ghostty · Editor: Zed
- Double-tap Control toggles Ghostty's drop-down quick terminal (via Hammerspoon)

## Languages

[mise](https://mise.jdx.dev) manages Node (LTS) + pnpm, Ruby, Go, and uv. uv manages Python
(`uv python install --default`; see Quick Start step 6). Projects pin versions with `mise use <tool>@<version>` (writes `mise.toml`).

## Keeping ~ clean

`shell/.zshenv` sets XDG base dirs and points npm config, Python, Ruby/Bundler, Go, and less history
files into `~/.config`, `~/.cache`, `~/.local/share`, and `~/.local/state`.
Only redirects that work in every use case (not just from a shell) belong here; otherwise data stays
where the tool expects it, so nothing is duplicated (e.g. npm's cache stays in `~/.npm`).
Code projects live in `~/Developer`, web content in `~/Sites`. Non-iCloud personal content
(`~/Books`, `~/VTT Assets`) intentionally lives in `~`.
