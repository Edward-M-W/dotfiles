#!/bin/bash

# Remove existing workspace items
sketchybar --remove '/space\..*/'

for sid in $(aerospace list-workspaces --monitor all --empty no); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        icon.drawing=off\
        background.height=26 \
        label.padding_left=15 \
        label.padding_right=15 \
        label="$sid" \
        click_script="aerospace workspace $sid"

    if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
        sketchybar --set space.$sid background.color=0x9c6e6d89
    else
        sketchybar --set space.$sid background.color=$1
    fi
done
