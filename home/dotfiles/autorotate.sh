#!/run/current-system/sw/bin/bash

OUTPUT="eDP-1"
DEVICE="/dev/input/event8"

stdbuf -oL libinput debug-events --device "$DEVICE" | while IFS= read -r line; do

    if echo "$line" | grep -q "switch tablet-mode state 1"; then
        gnome-randr modify "$OUTPUT" -r inverted 2>&1
    elif echo "$line" | grep -q "switch tablet-mode state 0"; then
        gnome-randr modify "$OUTPUT" -r normal 2>&1
    fi
done
