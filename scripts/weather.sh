#!/usr/bin/env bash

#
# Nix4P Weather
#
# Change STATION to your nearest weather station.
#
# Examples:
#   KORD  Chicago O'Hare
#   KJFK  New York JFK
#   EGLL  London Heathrow
#   EDDF  Frankfurt
#

STATION="KORD"

curl -fsS "https://wttr.in/${STATION}?format=%t" || echo "--"
