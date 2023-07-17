#!/bin/sh
playerctl $1

if [[ $1 == *"play"* ]]; then
    status=$(playerctl status)  

    if [[ $status == *"lay"* ]]; then
        notify-send "▶️ Play" -u normal
    fi

    if [[ $status == *"aus"* ]]; then
        notify-send "⏸️ Paused" -u normal
    fi
fi

if [[ $1 == *"next"* ]]; then
  notify-send "➡️ Next" -u normal
fi

if [[ $1 == *"previuos"* ]]; then
  notify-send "⬅️ Previuos" -u normal
fi