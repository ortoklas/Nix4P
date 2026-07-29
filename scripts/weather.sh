#!/usr/bin/env bash

CITY="Chicago+O'Hare"

temp=$(curl -fsS "https://wttr.in/${CITY}?format=%t" 2>/dev/null)

# Fallback if wttr.in returns bad data
case "$temp" in
    ""|"Unknown location"|"-1766°F")
        echo "--"
        ;;
    *)
        echo "$temp"
        ;;
esac
