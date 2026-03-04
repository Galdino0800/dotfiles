#!/usr/bin/env bash

# Mata instâncias antigas de todas as barras
killall -q polybar

# Aguarda os processos serem encerrados
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lança as duas barras de forma independente
polybar top &
polybar bottom &

# Feedback opcional no terminal
echo "Barras Top e Bottom lançadas..."