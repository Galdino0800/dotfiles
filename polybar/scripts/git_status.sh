#!/bin/bash
REPO="/home/ghost/dotfiles"

# Se o script for chamado com "check", ele faz o fetch e avisa
if [ "$1" == "check" ]; then
    notify-send "󰊤 Git" "Verificando atualizações no GitHub..." -i distritubutor-logo-archlinux
    git -C "$REPO" fetch origin > /dev/null 2>&1
fi

if [ ! -d "$REPO/.git" ]; then
    echo "Erro Path"
    exit
fi

# Verifica se estamos atrás (updates para baixar) ou na frente (updates para subir)
STATUS_AHEAD=$(git -C "$REPO" rev-list --count HEAD..origin/main 2>/dev/null)
STATUS_BEHIND=$(git -C "$REPO" rev-list --count origin/main..HEAD 2>/dev/null)

if [ "$STATUS_AHEAD" -gt 0 ]; then
    echo "Pendente ↑"
    [ "$1" == "check" ] && notify-send "󰊤 Git" "Você tem $STATUS_AHEAD commits para subir (gpush)!"
elif [ "$STATUS_BEHIND" -gt 0 ]; then
    echo "Update ↓"
    [ "$1" == "check" ] && notify-send "󰊤 Git" "Há atualizações no servidor para baixar!"
else
    echo "Sincronizado"
    [ "$1" == "check" ] && notify-send "󰊤 Git" "Tudo em dia!"
fi