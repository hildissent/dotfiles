# Global conventions

The user values a tidy system: no stray files in ~, no unnecessary or outdated config.

## Dotfiles
- All config lives in ~/.dotfiles (GitHub: dotfiles) and is symlinked by bootstrap.sh.
- Only keep config for software that is actually installed. When a tool is added or removed, update the repo, bootstrap.sh, and the Brewfile record (`brew bundle dump --file=~/.dotfiles/Brewfile --force --no-vscode && sed -i '' '/^go "/d' ~/.dotfiles/Brewfile`).
- Ask before committing or pushing.

## Where things go
- Code projects: ~/Developer/<project>/, one git repo each.
- Web content: ~/Sites/.
- Never create files directly in ~ for tool data. Where a tool honors XDG dirs, use them (env vars in shell/.zshenv): ~/.config, ~/.cache, ~/.local/share, ~/.local/state.
- Predictable beats tidy. Only redirect a tool's data if the redirect holds in every typical use (shell, GUI apps, editors, other launchers). Otherwise leave the data where the tool expects it, so there is never a duplicate in two places.
- Non-iCloud personal content (e.g. ~/Books, ~/VTT Assets) deliberately lives in ~. Leave it alone.

## Languages and tooling
- Versions are managed by **mise** (global defaults in ~/.config/mise/config.toml). Pin per project with `mise use <tool>@<version>`, which writes mise.toml in the project.
- **Node**: use **pnpm**, not npm or yarn.
- **Python**: use **uv** for everything: `uv init`, `uv add`, `uv run`; one-off tools with `uvx`. Project venvs live in .venv inside the project. Never pip install globally or use the system /usr/bin/python3.
- **Ruby**: managed by mise; use Bundler per project.
- **Go**: managed by mise; GOPATH is ~/.local/share/go.
- Don't install other version managers (nvm, pyenv, rbenv, asdf, etc.).
