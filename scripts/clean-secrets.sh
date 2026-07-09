#!/bin/bash
# Clean filter: replaces real secret values with placeholders before committing
sed -E 's/"(OBSIDIAN_API_KEY)": ".*"/"\1": "PLACEHOLDER"/g'
