#!/bin/bash
# Clean filter: replaces real API key with placeholder before committing
sed 's/"OBSIDIAN_API_KEY": ".*"/"OBSIDIAN_API_KEY": "PLACEHOLDER"/g'
