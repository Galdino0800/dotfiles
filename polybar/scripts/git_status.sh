#!/bin/bash
REPO="/home/ghost/dotfiles"

# Se clicar, ele vai no servidor espiar (Fetch)
if [ "$1" == "check" ]; then
    notify-send "󰊤 Git" "Sincronizando com GitHub..." -i git
    git -C "$REPO" fetch origin > /dev/null 2>&1
fi

# 1. Verifica se você editou arquivos e NÃO deu gpush (Local)
MODIFIED=$(git -C "$REPO" status --porcelain | wc -l)

# 2. Verifica se o GitHub tem coisas que você não baixou (Remoto)
AHEAD=$(git -C "$REPO" rev-list --count HEAD..origin/main 2>/dev/null)

if [ "$MODIFIED" -gt 0 ]; then
    echo "Modificado ($MODIFIED)"
    [ "$1" == "check" ] && notify-send "󰊤 Git" "Você editou $MODIFIED arquivos. Rode gpush!"
elif [ "$AHEAD" -gt 0 ]; then
    echo "Update ($AHEAD) ↓"
    [ "$1" == "check" ] && notify-send "󰊤 Git" "Há novidades no servidor!"
else
    echo "Sincronizado"
    [ "$1" == "check" ] && notify-send "󰊤 Git" "Tudo limpo e salvo!"
fi