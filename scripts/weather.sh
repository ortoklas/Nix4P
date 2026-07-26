#!/usr/bin/env bash

curl -s "https://api.open-meteo.com/v1/forecast?latitude=41.25&longitude=-87.75&current=temperature_2m,weather_code&temperature_unit=fahrenheit" \
    | jq -r '.current.temperature_2m'
