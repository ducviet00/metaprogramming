#!/bin/bash
pidwait() {
    local pid=$1
    local wait_interval=5  # Adjust this value based on your preferences

    # Check if the process exists
    if kill -0 "$pid" 2>/dev/null; then
        echo "Waiting for process with PID $pid to complete..."
        while kill -0 "$pid" 2>/dev/null; do
            sleep "$wait_interval"
        done
        echo "Process with PID $pid has completed."
    else
        echo "Process with PID $pid does not exist."
    fi
}