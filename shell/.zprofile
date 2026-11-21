# Homebrew (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# User binaries (uv tools and Python). Set here, not .zshenv, because
# macOS path_helper (/etc/zprofile) reorders PATH after .zshenv runs.
export PATH="$HOME/.local/bin:$PATH"
