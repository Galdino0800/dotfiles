#!/bin/bash

# Pega apenas Ícone (%c) e Temperatura (%t) de Juazeiro do Norte
DATA=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%c+%t")

# Filtro contra o erro de "render failed" ou resposta vazia
if [[ "$DATA" == *"render"* || -z "$DATA" ]]; then
    echo "󰖐 N/A"
else
    # Remove o nome da cidade (caso o wttr.in insista em mandar) e limpa espaços
    RESULT=$(echo "$DATA" | sed 's/[jJ]uazeiro [dD]o [nN]orte: //g' | xargs)
    
    echo "$RESULT"
fi