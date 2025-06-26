#!/bin/bash

# Usage: ./analyze-nginx-logs.sh access.log

LOG_FILE="$1"

if [[ -z "$LOG_FILE" || ! -f "$LOG_FILE" ]]; then
    echo "❌ Please provide a valid log file as an argument."
    exit 1
fi

echo "==================== LOG ANALYSIS ===================="

# Top 5 IP addresses
echo -e "\n📍 Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'

# Top 5 requested paths
echo -e "\n🌐 Top 5 most requested paths:"
awk -F\" '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'

# Top 5 response status codes
echo -e "\n📦 Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'

# Top 5 user agents
echo -e "\n🤖 Top 5 user agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " " $3 " " $4 " " $5 " " $6 " - " $1 " requests"}'

echo -e "\n======================================================"
