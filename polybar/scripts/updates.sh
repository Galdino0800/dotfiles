#!/usr/bin/env bash

# 1. Verifica se as ferramentas existem
if ! command -v checkupdates &> /dev/null; then
    echo "   Instalar pacman-contrib"
    exit 0
fi

# 2. Conta atualizações do sistema e do AUR
updates_arch=$(checkupdates 2>/dev/null | wc -l)

if command -v yay &> /dev/null; then
    updates_aur=$(yay -Qum 2>/dev/null | wc -l)
else
    updates_aur=0
fi

updates=$((updates_arch + updates_aur))

# 3. Função para enviar a notificação quando clicado
if [ "$1" == "notify" ]; then
    if [ "$updates" -gt 0 ]; then
        notify-send -u normal -i software-update-available "Atualizações Pendentes" \
        " Pacman: $updates_arch\n󰊤 AUR (Yay): $updates_aur\n\nTotal: $updates pacotes"
    else
        notify-send -u low -i checkbox-checked "Sistema Atualizado" "Não há atualizações pendentes."
    fi
    exit 0
fi

# 4. Saída visual para a Polybar
if [ "$updates" -gt 0 ]; then
    echo " 󰚰  $updates"
else
    echo "󰄬"
fi