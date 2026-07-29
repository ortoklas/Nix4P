#!/usr/bin/env bash

CITY="Chicago+O'Hare"
CACHE="$HOME/.cache/nix4p/weather"

mkdir -p "$(dirname "$CACHE")"

while true; do
    temp=$(curl -fsS "https://wttr.in/${CITY}?format=%t" 2>/dev/null)

    case "$temp" in
        ""|"Unknown location"|"-1766°F")
            if [[ -f "$CACHE" ]]; then
                :
            else
                echo "--" > "$CACHE"
            fi
            ;;
        *)
            echo "$temp" > "$CACHE"
            ;;
    esac

    sleep 900
done
