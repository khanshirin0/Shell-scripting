#!/bin/bash

while true; do
    clear  # Clear the terminal window

    # Get the current time in HH:MM:SS format
    current_time=$(date +"%T")

    # Print the current time
    echo "Digital Clock"
    echo "------------"
    echo "Current Time: $current_time"

    # Wait for 1 second before updating the time
    sleep 1
done
