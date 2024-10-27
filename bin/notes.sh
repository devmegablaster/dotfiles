#!/bin/bash

# Get the date
DATE=$(date +%Y-%m-%d)

# Get the time
TIME=$(date +%H:%M)

# Get the file name from the first argument if it exists
if [ -z "$1" ]
then
    FILE_NAME=$(date +%Y-%m-%d)
else
    FILE_NAME=$1
fi

# Get the file path
# Change this to your iCloud Drive notes directory
ICLOUD_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault"
FILE_PATH="$ICLOUD_DIR/$FILE_NAME.md"

# Ensure the directory exists
mkdir -p "$ICLOUD_DIR"

# Debugging output
echo "File path: $FILE_PATH"

# Create the file
touch "$FILE_PATH"

# Open the file in nvim
if [ -z "$1" ]
then
  # If the file is empty, add the date
  if [ ! -s "$FILE_PATH" ]; then
    echo "# $DATE" >> "$FILE_PATH"
  fi

  nvim -c "normal Go" \
    -c "normal Go## $TIME" \
    -c "normal G2o" \
    -c "normal zz" \
    -c "startinsert" "$FILE_PATH"
else
  nvim -c "normal Go" \
    -c "startinsert" "$FILE_PATH"
fi

