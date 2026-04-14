alias ls='eza --group-directories-first'
alias ll='eza -lah --group-directories-first --git'
alias la='eza -la --group-directories-first --git'
alias lt='eza --tree --level=2 --group-directories-first'
alias ltt='eza --tree --level=3 --group-directories-first'
alias ..='cd ..'
alias ...='cd ../..'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git log'
alias gb='git branch'
alias gco='git checkout'
alias glog='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gds='git diff --staged'

# Utilities
alias grep='grep --color=auto'
alias less='less -R'
alias cat='bat --paging=never'
alias catp='bat'
