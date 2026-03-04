#!/bin/bash

get_battery() {
    device=$(bluetoothctl info | grep "Device" | awk '{print $2}')
    if [ -n "$device" ]; then
        upower -i $(upower -e | grep "headset") 2>/dev/null | grep percentage | awk '{print $2}'
    fi
}

status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [ "$status" = "yes" ]; then
    if bluetoothctl info &>/dev/null; then
        name=$(bluetoothctl info | grep "Name" | cut -d ' ' -f2-)
        battery=$(get_battery)
        if [ -n "$battery" ]; then
            echo " $name ($battery)"
        else
            echo " $name"
        fi
    else
        echo " On"
    fi
else
    echo " Off"
fi