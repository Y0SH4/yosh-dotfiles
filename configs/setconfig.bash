#!/bin/bash

# Source directory
source_dir="/path/to/source_directory"

# Destination directory
destination_dir="/path/to/destination_directory"

# Ensure the destination directory exists
mkdir -p "$destination_dir"

# Create symlinks for all files in the source directory to .conf files in the destination directory
for file in "$source_dir"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        ln -s "$file" "$destination_dir/${filename}.conf"
        echo "Linked: $file to ${destination_dir}/${filename}.conf"
    fi
done

echo "Linking process completed."
