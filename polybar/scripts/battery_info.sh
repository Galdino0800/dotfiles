#!/bin/bash

# Configurações do seu hardware
PATH_BAT="/sys/class/power_supply/BAT1"
CAPACITY=$(cat $PATH_BAT/capacity)
STATUS_RAW=$(cat $PATH_BAT/status)

# Tradução do estado para ficar mais bonito
case $STATUS_RAW in
    "Charging")    STATUS="Carregando" ;;
    "Discharging") STATUS="Descarregando" ;;
    "Full")        STATUS="Totalmente Carregada" ;;
    *)             STATUS=$STATUS_RAW ;;
esac

# Função de Notificação (Clique)
if [ "$1" == "info" ]; then
    # Tenta pegar o tempo pelo acpi (mais direto)
    # Exemplo de saída do acpi: Battery 1: Discharging, 75%, 02:30:15 remaining
    TIME_LEFT=$(acpi -b | grep "Battery 1" | awk -F', ' '{print $3}' | cut -d ' ' -f1)

    # Se o acpi falhar ou não mostrar tempo (ex: na tomada), tenta o upower
    if [ -z "$TIME_LEFT" ] || [ "$TIME_LEFT" == "until" ] || [ "$TIME_LEFT" == "remaining" ]; then
        TIME_LEFT=$(upower -i $(upower -e | grep 'BAT') | grep -E "to\ empty|to\ full" | awk '{print $3 " " $4}')
    fi

    # Se ainda assim estiver vazio (bateria cheia ou calculando)
    [ -z "$TIME_LEFT" ] && TIME_LEFT="Calculando ou na Tomada"

    # Envia a notificação formatada para o Dunst
    notify-send "🔋 Status da Bateria" "Carga: $CAPACITY%\nEstado: $STATUS\nTempo: $TIME_LEFT" -i battery
    exit
fi

# A Polybar só precisa da porcentagem para o módulo interno
echo "$CAPACITY"