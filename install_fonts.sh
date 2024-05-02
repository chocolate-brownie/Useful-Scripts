#!/bin/bash

# Define the source directory as the current directory
FONT_DIR=$(pwd)

# Define the target directory
TARGET_DIR=~/.local/share/fonts

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Find and copy font files
find "$FONT_DIR" -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp {} "$TARGET_DIR" \;

# Update the font cache
fc-cache -fv

