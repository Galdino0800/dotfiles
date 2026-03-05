#!/bin/sh

# Verifica se o bluetooth está ligado
if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo "%{F#66}%{F-}" # Ícone cinza se estiver desligado
else
  # Verifica se há algum dispositivo conectado
  if [ $(bluetoothctl info | grep "Connected: yes" | wc -l) -eq 0 ]; then
    echo "" # Ícone normal se estiver ligado mas sem nada
  else
    # Opcional: Mostra o nome do dispositivo conectado (ex: Fone)
    DEVICE=$(bluetoothctl info | grep "Name" | cut -d ' ' -f 2-)
    echo " $DEVICE"
  fi
fi