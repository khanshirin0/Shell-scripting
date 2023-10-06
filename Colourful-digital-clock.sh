#!/bin/bash

while true; do
    clear  # Clear the terminal window

    # Get the current time in HH:MM:SS format
    current_time=$(date +"%T")

    # Generate a random number between 31 and 36 for ANSI color codes
    color_code=$((RANDOM % 6 + 31))

    # Print the current time with a random color
    echo -e "\e[1;${color_code}mDigital Clock\e[0m"
    echo -e "\e[${color_code}m------------\e[0m"
    echo -e "\e[${color_code}mCurrent Time: $current_time\e[0m"

    # Wait for 1 second before updating the time
    sleep 1
done
