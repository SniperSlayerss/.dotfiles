#!/usr/bin/env bash
output_dir=~/org/images
mkdir -p "$output_dir"

# take screenshot
hyprshot -m region -o "$output_dir"

# find the most recently created file in the output directory
file=$(ls -t "$output_dir"/*.png 2>/dev/null | head -n1)

# check if a file was found
if [[ -z "$file" ]]; then
    echo "Error: No screenshot file found"
    exit 1
fi

# copy path to clipboard
wl-copy "$file"
echo "Saved: $file"
