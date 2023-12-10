#!/bin/bash

# Output and error log files
output_log="output.log"
error_log="error.log"

# Counter for the number of runs
run_count=0

# Run the script until it fails
while true; do
    # Run the provided script and capture output and errors
    ./exercise3.sh >> "$output_log" 2>> "$error_log"

    # Check the exit status of the script
    if [ $? -ne 0 ]; then
        echo "Script failed on run $((++run_count))"
        break
    fi

    # Increment the run count
    ((run_count++))
done

# Print the captured output and errors
echo -e "\n===== Captured Output ====="
cat "$output_log"

echo -e "\n===== Captured Errors ====="
cat "$error_log"

# Print the total number of runs
echo "Total runs: $run_count"

# Clean up log files
rm "$output_log" "$error_log"
