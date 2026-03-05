#!/bin/bash
# Verifica pacotes oficiais e do AUR
updates_arch=$(checkupdates 2> /dev/null | wc -l)
updates_aur=$(yay -Qua 2> /dev/null | wc -l)

updates=$(($updates_arch + $updates_aur))

if [ "$updates" -gt 0 ]; then
    echo "$updates"
else
    echo "0"
fi