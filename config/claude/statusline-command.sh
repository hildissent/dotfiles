#!/bin/bash
# Status line converted from ~/.zshrc PS1:
#   '%(?..[%F{red}%?%f] )%F{blue}%n%f@%F{green}%m%f %F{yellow}%1~%f%F{red}$(parse_git_branch)%f %# '

input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

user=$(whoami)
host=$(hostname -s)
dir=$(basename "$cwd")

branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)

# Dimmed ANSI colors: blue=user, green=host, yellow=dir, red=git branch
printf '\033[2;34m%s\033[0m@\033[2;32m%s\033[0m \033[2;33m%s\033[0m' "$user" "$host" "$dir"
if [ -n "$branch" ]; then
    printf ' \033[2;31m(%s)\033[0m' "$branch"
fi
