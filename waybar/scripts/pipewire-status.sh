#!/bin/bash

# Get default sink volume and mute status
STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

# Parse the output
VOLUME=$(echo "$STATUS" | awk '{print int($2 * 100)}')
MUTED=$(echo "$STATUS" | grep -q MUTED && echo "true" || echo "false")

# Choose icon
if [ "$MUTED" == "true" ]; then
    ICON=""  # Font Awesome: muted
elif [ "$VOLUME" -lt 30 ]; then
    ICON=""  # low volume
elif [ "$VOLUME" -lt 70 ]; then
    ICON=""  # medium volume
else
    ICON=""  # high volume
fi

# Output JSON for Waybar
echo "{\"text\": \"$ICON $VOLUME%\", \"tooltip\": \"Volume: $VOLUME%\", \"class\": \"volume\"}"

