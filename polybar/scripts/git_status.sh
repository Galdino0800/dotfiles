#!/bin/bash
REPO="/home/ghost/dotfiles"

if [ ! -d "$REPO/.git" ]; then
    echo "󰊤 Path Errado"
    exit
fi

STATUS=$(git -C "$REPO" status -uno 2>/dev/null | grep -c "ahead")

if [ "$STATUS" -gt 0 ]; then
    echo "󰊤 Out of Sync"
else
    echo "󰊤 Synced"
fi