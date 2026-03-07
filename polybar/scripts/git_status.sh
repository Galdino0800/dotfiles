#!/bin/bash
REPO="/home/ghost/dotfiles"

if [ ! -d "$REPO/.git" ]; then
    echo "Erro Path"
    exit
fi

STATUS=$(git -C "$REPO" status -uno 2>/dev/null | grep -c "ahead")

if [ "$STATUS" -gt 0 ]; then
    echo "Pendente"
else
    echo "Sincronizado"
fi