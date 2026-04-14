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
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' menu select                         # Use arrow keys to navigate
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored file listings
zstyle ':completion:*:*:git:*' script ~/.dotfiles/scripts/git-completion.sh
autoload bashcompinit && bashcompinit
[[ -r ~/Projects/autopkg_complete/autopkg ]] && source ~/Projects/autopkg_complete/autopkg

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

# Simple prompt — shows exit code of last command if non-zero
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='%(?..[%F{red}%?%f] )%F{blue}%n%f@%F{green}%m%f %F{yellow}%1~%f%F{red}$(parse_git_branch)%f %# '

# Up/down arrow: search history by prefix (what you've already typed)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Syntax highlighting (must come before autosuggestions)
source /usr/local/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fish-like inline autosuggestions from history
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept   # Ctrl+Space to accept suggestion

# fzf integration for command history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Better history search with fzf
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# Use fd for fzf file search
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"

# rbenv (Ruby Version Manager)
eval "$(rbenv init - zsh)"

# Auto-list directory contents after cd
chpwd() {
    eza --group-directories-first
}

# zoxide: smarter cd with frecency (use 'z' to jump, 'zi' for interactive fzf)
eval "$(zoxide init zsh)"

# --- Shell functions ---

# mkcd: make a directory and cd into it
mkcd() {
    mkdir -p "$@" && cd "${@: -1}"
}

# extract: universal archive extractor
extract() {
    if [ -z "$1" ]; then
        echo "Usage: extract <archive>"
        return 1
    fi
    if [ ! -f "$1" ]; then
        echo "'$1' is not a file"
        return 1
    fi
    case "$1" in
        *.tar.bz2)  tar xjf "$1"   ;;
        *.tar.gz)   tar xzf "$1"   ;;
        *.tar.xz)   tar xJf "$1"   ;;
        *.tar.zst)  tar --zstd -xf "$1" ;;
        *.tar)      tar xf "$1"    ;;
        *.bz2)      bunzip2 "$1"   ;;
        *.gz)       gunzip "$1"    ;;
        *.zip)      unzip "$1"     ;;
        *.7z)       7z x "$1"      ;;
        *.rar)      unrar x "$1"   ;;
        *.xz)       xz -d "$1"     ;;
        *.zst)      zstd -d "$1"   ;;
        *)          echo "Don't know how to extract '$1'" ; return 1 ;;
    esac
}

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2.zsh" && source "${HOME}/.iterm2.zsh"
