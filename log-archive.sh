#!/bin/bash

# Log Archive Tool
# Usage: ./log-archive.sh /path/to/log-directory

# Exit on error
set -e

# Check if argument (log directory) is provided
if [ -z "$1" ]; then
    echo "❌ Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "❌ Error: Log directory '$LOG_DIR' does not exist."
    exit 2
fi

# Archive directory
ARCHIVE_DIR="$HOME/log_archives"
mkdir -p "$ARCHIVE_DIR"

# Generate timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Archive file name
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

# Compress the logs
echo "📦 Archiving logs from '$LOG_DIR'..."
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

# Log the archive creation
LOG_FILE="${ARCHIVE_DIR}/archive_log.txt"
echo "$TIMESTAMP - Archived logs from $LOG_DIR to $ARCHIVE_PATH" >> "$LOG_FILE"

echo "✅ Logs archived successfully: $ARCHIVE_PATH"
echo "📝 Archive record saved to: $LOG_FILE"

