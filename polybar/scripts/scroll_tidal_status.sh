#!/bin/bash

# O nome exato que o seu sistema mostrou no playerctl -l
PLAYER="io.github.nokse22.high-tide"

# Tenta pegar artista e título
metadata=$(playerctl -p $PLAYER metadata --format "{{ artist }} - {{ title }}" 2>/dev/null)

if [ -z "$metadata" ]; then
    echo "" # Fica invisível se não tiver música
else
    # Mostra o ícone e a música (limitado a 25 caracteres)
    echo "󰓇 ${metadata:0:25}"
fi