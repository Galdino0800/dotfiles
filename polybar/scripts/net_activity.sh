#!/bin/bash

# Altere para sua interface (ex: ens33 na VM ou wlan0 no físico)
INTERFACE="enp0s3"

# Pega o tráfego inicial
R1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
T1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 0.5
# Pega o tráfego após meio segundo
R2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
T2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# Define os ícones (Setas acesas ou apagadas/vazias)
[[ $R2 -gt $R1 ]] && DOWN="󰁅" || DOWN=" "
[[ $T2 -gt $T1 ]] && UP="󰁝" || UP=" "

# Pega o nome da rede (SSID) ou interface se estiver na VM
SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
[[ -z "$SSID" ]] && SSID=$(ip link show $INTERFACE | awk '{print $2}' | tr -d ':')

echo "$SSID $UP $DOWN"