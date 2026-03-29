#!/run/current-system/sw/bin/bash

OUTPUT="eDP-1"
DEVICE="/dev/input/yoga-tablet-switch"

stdbuf -oL libinput debug-events --device "$DEVICE" | while IFS= read -r line; do

    if echo "$line" | grep -q "switch tablet-mode state 1"; then
        niri msg output "$OUTPUT" transform 180
    elif echo "$line" | grep -q "switch tablet-mode state 0"; then
        niri msg output "$OUTPUT" transform normal
    fi
done
