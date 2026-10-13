#!/bin/bash

LOG_PATH="/var/log"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") #array in shell scripting

echo "find objects with changes in the last 30 days"
LOG_FILES=$(find "$LOG_PATH" -type f -name "*.log" -mtime -30)
echo "$LOG_FILES"

for LOG_FILE in $LOG_FILES; do

	for PATTERN in "${ERROR_PATTERNS[@]}"; do

		grep "$PATTERN" "$LOG_FILE" 
		grep -c "$PATTERN" "$LOG_FILE" 
	done
done
