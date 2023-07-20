#!/bin/sh
current_volume_pc=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
new_volume_pc=$(($current_volume_pc + 5))

pactl set-sink-mute @DEFAULT_SINK@ 0

if [ $new_volume_pc -gt 99 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
    notify-send "🔊 Volume" -u normal -h int:value:100
elif [ $new_volume_pc -lt 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    notify-send "🔊 Volume" -u normal -h int:value:$new_volume_pc
fi