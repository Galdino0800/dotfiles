#!/bin/bash

# Busca os dados detalhados (Temperatura, Vento, Umidade, Sensação)
DATA=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%c+%t+%w+%h+%f")

if [[ "$DATA" == *"render"* || -z "$DATA" ]]; then
    notify-send -a "Clima" "󰖐 Erro de Conexão" "Não foi possível carregar o clima agora."
else
    # Extrai cada pedaço (awk é nosso amigo aqui)
    ICON=$(echo "$DATA" | awk '{print $1}')
    TEMP=$(echo "$DATA" | awk '{print $2}')
    VENTO=$(echo "$DATA" | awk '{print $3}')
    UMID=$(echo "$DATA" | awk '{print $4}')
    SENS=$(echo "$DATA" | awk '{print $5}')

    # Monta a mensagem bonita com quebras de linha (\n)
    # Usamos tags <b> para negrito (se o seu Dunst aceitar markup)
    TITULO=" Clima em Juazeiro do Norte"
    MSG="<b>Condição:</b> $ICON $TEMP\n"
    MSG+="<b>Sensação:</b> $SENS\n"
    MSG+="<b>Vento:</b> 󰖝 $VENTO\n"
    MSG+="<b>Umidade:</b> 󰍟 $UMID"

    # Envia a notificação com um ícone de sistema (opcional)
    notify-send -a "Weather" -u normal "$TITULO" "$MSG"
fi