#!/usr/bin/env bash

sketchybar \
	--add item sound right \
	--set sound \
	icon.padding_left=10 \
	label.padding_right=10 \
	background.height=26 \
	background.padding_right=5 \
	background.drawing=on \
	script="$PLUGIN_DIR/sound.sh" \
	--subscribe sound volume_change
