#!/bin/bash

# Define the file path
BRIGHTNESS_FILE="$HOME/.cache/.myvalue/ddcutil/current_brightness"

# Create the necessary directories
mkdir -p "$(dirname "$BRIGHTNESS_FILE")"

# Check if the current_brightness file exists; if not, create it
if [ ! -f "$BRIGHTNESS_FILE" ]; then
    touch "$BRIGHTNESS_FILE"
fi

# Get the current brightness value
current_brightness=$(ddcutil getvcp 10 | awk '/current value/ {print $9}' | sed 's/,//')

# Write the value to the file
echo "$current_brightness" > "$BRIGHTNESS_FILE"
