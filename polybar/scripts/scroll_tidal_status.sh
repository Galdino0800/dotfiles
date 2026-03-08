#!/bin/bash
PLAYER="io.github.nokse22.high-tide"
metadata=$(playerctl -p $PLAYER metadata --format "{{ artist }} - {{ title }}" 2>/dev/null)

if [ -z "$metadata" ]; then
    echo "" 
else
    # REMOVA o ícone daqui, deixe só o texto
    echo "${metadata:0:25}"
fi