#!/bin/bash

sketchybar --add item aerospace_workspaces left\
    --subscribe aerospace_workspaces aerospace_workspace_change\
    --set aerospace_workspaces\
    icon.drawing=off\
    label.drawing=off\
    script="$PLUGIN_DIR/aerospace.sh $ITEM_COLOUR"


