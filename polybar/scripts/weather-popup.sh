#!/usr/bin/env bash

# Coleta os dados (Temperatura, Sensação, Vento, Condição)
DATA=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%t|%f|%w|%C")
# Coleta a previsão para amanhã
AMANHA=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%f" | sed -n '3p' | xargs)

# Separa as variáveis usando o pipe |
IFS='|' read -r TEMP SENS VENTO COND <<< "$DATA"

# Limpa o sinal de + e espaços
TEMP=$(echo $TEMP | sed 's/+//g')
SENS=$(echo $SENS | sed 's/+//g')
TEMP_VAL=$(echo $TEMP | grep -oE '[0-9]+') # Pega só o número para o alerta

# Monta a mensagem sem os asteriscos e com ícones Nerd Font
MSG="Temperatura: $TEMP
Sensação: $SENS
Vento: $VENTO
Condição: $COND
Amanhã: $AMANHA"

# Dispara a notificação principal
notify-send "Clima em Juazeiro" "$MSG"

# --- ALERTAS AUTOMÁTICOS ---

# Alerta de Calor (>35°C)
if [ ! -z "$TEMP_VAL" ] && [ "$TEMP_VAL" -gt 35 ]; then
    notify-send -u critical "ALERTA DE CALOR" "Juazeiro está fervendo: $TEMP! Beba água."
fi

# Alerta de Chuva
if [[ "$COND" == *"Rain"* ]] || [[ "$COND" == *"chuva"* ]] || [[ "$COND" == *"Shower"* ]]; then
    notify-send -u normal "ALERTA DE CHUVA" "Previsão de chuva detectada em Juazeiro."
fi