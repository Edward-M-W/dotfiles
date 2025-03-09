#!/usr/bin/env bash

sketchybar \
	--add item front_app left \
	--set front_app script="$PLUGIN_DIR/front_app.sh" \
	icon.drawing=off \
	background.height=26 \
	background.padding_left=0 \
	background.padding_right=10 \
	label.padding_left=10 \
	label.padding_right=10 \
	associated_display=active \
	--subscribe front_app front_app_switched

sketchybar --add item separator left \
	--set separator icon= \
	icon.font="$FONT:Regular:16.0" \
	background.padding_left=5 \
	background.padding_right=10 \
	label.drawing=off \
	background.drawing=off \
	associated_display=active \
