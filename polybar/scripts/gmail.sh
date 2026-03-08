#!/bin/bash

USER="seuemail@gmail.com"
PASS="ntcz poxa zngn xdyi"

# Consulta o feed do Gmail e conta as mensagens não lidas
COUNT=$(curl -u "$USER:$PASS" -s "https://mail.google.com/mail/feed/atom" | grep -c "<entry>")

if [ "$COUNT" -gt 0 ]; then
    echo "$COUNT"
else
    echo "0"
fi