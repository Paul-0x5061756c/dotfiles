#!/bin/bash

used=$(free -h | awk '/Mem:/ {print $3}')
total=$(free -h | awk '/Mem:/ {print $2}')
percent=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')

echo "<span foreground='#f5c2e7'>🧠</span> ${used} / ${total} (${percent}%)"

