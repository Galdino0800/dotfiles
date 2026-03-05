#!/usr/bin/env bash

# Garante que a notificação encontre a tela do notebook
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

# Coleta os dados de Juazeiro do Norte (Temp, Sensação, Vento, Condição)
DATA=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%t|%f|%w|%C")
# Coleta previsão de amanhã
AMANHA=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%f" | sed -n '3p' | xargs)

# Separa as variáveis pelo pipe |
IFS='|' read -r TEMP SENS VENTO COND <<< "$DATA"

# Limpa sinais de + e espaços extras
TEMP=$(echo $TEMP | sed 's/+//g')
SENS=$(echo $SENS | sed 's/+//g')
TEMP_VAL=$(echo $TEMP | grep -oE '[0-9]+' | head -1)

# Monta a mensagem final sem as estrelas (**)
MSG="Temperatura: $TEMP
Sensacao: $SENS
Vento: $VENTO
Condicao: $COND
Amanha: $AMANHA"

# Dispara a notificação (dura 8 segundos)
notify-send -t 8000 "Clima em Juazeiro" "$MSG"

# --- ALERTAS AUTOMÁTICOS ---

# Alerta de Calor Crítico (>= 35°C)
if [ ! -z "$TEMP_VAL" ] && [ "$TEMP_VAL" -ge 35 ]; then
    notify-send -u critical "ALERTA DE CALOR" "Juazeiro atingiu $TEMP! Nao esqueca de beber agua."
fi

# Alerta de Chuva
if [[ "$COND" == *"Rain"* ]] || [[ "$COND" == *"Shower"* ]] || [[ "$COND" == *"Storm"* ]]; then
    notify-send -u normal "ALERTA DE CHUVA" "Previsao de chuva em Juazeiro: $COND"
fi