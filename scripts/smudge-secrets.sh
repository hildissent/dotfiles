#!/bin/bash
# Smudge filter: restores real secret values from local secrets file on checkout
SECRETS_FILE="$HOME/.dotfiles/.secrets"
if [ -f "$SECRETS_FILE" ]; then
    KEY=$(grep '^OBSIDIAN_API_KEY=' "$SECRETS_FILE" | cut -d'=' -f2)
    if [ -n "$KEY" ]; then
        sed "s/\"OBSIDIAN_API_KEY\": \"PLACEHOLDER\"/\"OBSIDIAN_API_KEY\": \"$KEY\"/g"
        exit 0
    fi
fi
# If no secrets file or key, pass through unchanged
cat
