# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# History options
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Autocomplete improvements
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case-insensitive
zstyle ':completion:*' menu select                          # Use arrow keys to navigate
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored file listings
zstyle ':completion:*:*:git:*' script ~/.dotfiles/scripts/git-completion.sh

# Ignore duplicate history entries
setopt HIST_IGNORE_ALL_DUPS

# Basic options
setopt AUTO_CD
setopt CORRECT
setopt PROMPT_SUBST

# Load aliases
if [ -f ~/.dotfiles/shell/aliases.sh ]; then
    source ~/.dotfiles/shell/aliases.sh
fi

# Simple prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="%F{blue}%n%f@%F{green}%m%f %F{yellow}%1~%f%F{red}$(parse_git_branch)%f %# "

# Syntax highlighting
source /usr/local/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf integration for command history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Better history search with fzf
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
