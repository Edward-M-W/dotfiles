#!/usr/bin/env bash

sketchybar --add item battery right \
	--set battery \
	update_freq=60 \
	icon.padding_left=10 \
	label.padding_right=10 \
	background.height=26 \
	background.padding_right=5 \
	script="$PLUGIN_DIR/power.sh" \
	--subscribe battery power_source_change
