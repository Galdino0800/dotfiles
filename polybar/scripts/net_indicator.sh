#!/bin/bash

IF="enp0s3"

RX1=$(cat /sys/class/net/$IF/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$IF/statistics/tx_bytes)

sleep 1

RX2=$(cat /sys/class/net/$IF/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$IF/statistics/tx_bytes)

DIFF=$(( (RX2 - RX1) + (TX2 - TX1) ))

if [ "$DIFF" -lt 1000 ]; then
    echo "··"
elif [ "$DIFF" -lt 50000 ]; then
    echo "·:"
else
    echo "::"
fi