#!/usr/bin/env bash

# Pega a porcentagem e o status
PERCENT=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)

# Define o ícone baseado no status
if [ "$STATUS" = "Charging" ]; then
    ICON="󱐋"
else
    ICON="󰁹"
fi

# Saída para a Polybar
echo "$ICON $PERCENT%"