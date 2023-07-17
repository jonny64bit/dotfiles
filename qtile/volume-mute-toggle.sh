#!/bin/sh
pactl set-sink-mute @DEFAULT_SINK@ toggle

mute_status=$(pactl get-sink-mute @DEFAULT_SINK@)
if [[ $mute_status == *"no"* ]]; then
  notify-send "🔇 Mute" -u normal
fi

if [[ $mute_status == *"yes"* ]]; then
  notify-send "🔊 Sound" -u normal
fi