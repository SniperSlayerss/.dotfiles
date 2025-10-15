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

clipboard_file="$file"
if [[ "$clipboard_file" == $HOME* ]]; then
    clipboard_file="~${clipboard_file#$HOME}"
fi
wl-copy "$clipboard_file"
echo -n "$clipboard_file" | xclip -selection clipboard

cliphist wipe
echo -n "$clipboard_file" | cliphist store

echo "Saved: $clipboard_file"
