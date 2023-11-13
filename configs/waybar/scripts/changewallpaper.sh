#!/usr/bin/env bash

DIR=$HOME/Pictures/Wallpaper
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

if [[ $(pidof swaybg) ]]; then
  pkill swww
fi

:'notify-send -i ${DIR}/${RANDOMPICS} "Wallpaper Changed" ${RANDOMPICS}'
swww img ${DIR}/${RANDOMPICS} --transition-type center
canberra-gtk-play -i window-attention
