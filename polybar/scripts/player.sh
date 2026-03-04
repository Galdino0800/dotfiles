#!/bin/bash

# Verifica se o mpc consegue falar com o MPD
if ! mpc status > /dev/null 2>&1; then
    echo "MPD Offline"
    exit 0
fi

# Pega o status atual
STATUS=$(mpc status | grep "\[" | awk '{print $1}')
SONG=$(mpc current)

if [ -z "$SONG" ]; then
    echo "MPD Player"
else
    echo "$SONG"
fi