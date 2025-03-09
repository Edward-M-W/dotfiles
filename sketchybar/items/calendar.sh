#!/usr/bin/env bash


sketchybar --add item calendar right \
	--set calendar update_freq=15 \
	icon.padding_left=10 \
	label.padding_right=10 \
	background.height=26 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=5 \
	background.border_width="$BORDER_WIDTH" \
	background.drawing=on \
	script="$PLUGIN_DIR/calendar.sh"
