
#!/bin/bash

STATUS=$(playerctl status 2>/dev/null)

if [ "$STATUS" != "Playing" ]; then
    exit 0
fi

OUTPUT=$(playerctl metadata --format '{{artist}} - {{title}}')

ESCAPED=$(echo "$OUTPUT" \
    | sed 's/&/\&amp;/g' \
    | sed 's/</\&lt;/g' \
    | sed 's/>/\&gt;/g' \
    | sed 's/"/\&quot;/g')

echo "   $ESCAPED"

