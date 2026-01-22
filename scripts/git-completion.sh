#!/bin/bash
# Git command completion for zsh

# Common git commands
_git_commands=(
    add bisect branch checkout cherry-pick clone commit config
    diff fetch flow init log merge mv pull push rebase reset
    revert rm show stash status tag
)

# Branch completion
_git_branch_completion() {
    git branch 2>/dev/null | grep -v '^\*' | sed 's/^[[:space:]]*//'
}

# For zsh completion, provide available commands and branches
if [[ "$COMP_CWORD" -eq 1 ]]; then
    printf '%s\n' "${_git_commands[@]}"
elif [[ "$COMP_CWORD" -gt 1 ]]; then
    _git_branch_completion
fi
