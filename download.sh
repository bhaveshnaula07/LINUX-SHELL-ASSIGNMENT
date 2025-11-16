#!/bin/bash
#AUTHOR: Bhavesh Singh Naula
#Date: 15/11/2025

# Predefined download directory
DOWNLOAD_DIR="$HOME/downloads_auto"

# Create directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# File URL to download
FILE_URL="https://example.com/sample.pdf"

echo "Downloading file..."
echo "URL: $FILE_URL"
echo "Saving to: $DOWNLOAD_DIR"

# Use wget (first preference)
if command -v wget >/dev/null 2>&1; then
    wget -O "$DOWNLOAD_DIR/downloaded_file" "$FILE_URL"
# If wget not available, use curl
elif command -v curl >/dev/null 2>&1; then
    curl -L "$FILE_URL" -o "$DOWNLOAD_DIR/downloaded_file"
else
    echo "Error: Neither wget nor curl is installed."
    exit 1
fi

echo "Download completed!"
echo "File saved at: $DOWNLOAD_DIR/downloaded_file"
