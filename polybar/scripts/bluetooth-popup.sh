#!/bin/bash

devices=$(bluetoothctl devices | cut -d ' ' -f3-)

chosen=$(echo -e "Power Toggle\nScan\n$devices" | rofi -dmenu -p "Bluetooth")

if [ "$chosen" = "Power Toggle" ]; then
    bluetoothctl power toggle
elif [ "$chosen" = "Scan" ]; then
    bluetoothctl scan on &
    sleep 5
    pkill bluetoothctl
else
    mac=$(bluetoothctl devices | grep "$chosen" | awk '{print $2}')
    bluetoothctl connect $mac
fi