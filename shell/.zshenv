# Disable Apple Terminal's per-session history (~/.zsh_sessions)
export SHELL_SESSIONS_DISABLE=1

# XDG base directories (keep tool files out of ~)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Editor
export EDITOR="zed"

# bat (better cat)
export BAT_THEME="ansi"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# less
export LESSHISTFILE="$XDG_STATE_HOME/lesshst"

# Node / npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"

# Python
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"   # no __pycache__ in projects

# Ruby
export GEMRC="$XDG_CONFIG_HOME/gem/gemrc"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem/specs"
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# Go
export GOPATH="$XDG_DATA_HOME/go"

# Obsidian CLI
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"
