#!/bin/bash

LOG_FILE=$1

if [ -z "$LOG_FILE" ]; then
  echo "Usage: ./log-analyzer.sh <logfile>"
  exit 1
fi

echo "===== ERROR ANALYSIS ====="

echo "Total ERROR count:"
grep -i "error" $LOG_FILE | wc -l

echo "Total WARNING count:"
grep -i "warning" $LOG_FILE | wc -l

echo "Recent Errors:"
grep -i "error" $LOG_FILE | tail -5

echo "Top 5 frequent errors:"
grep -i "error" $LOG_FILE | sort | uniq -c | sort -nr | head -5