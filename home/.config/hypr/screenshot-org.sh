#!/usr/bin/env bash
output_dir=~/org/images
mkdir -p "$output_dir"

# take note of the most recent file before taking a new one
last_file=$(ls -t "$output_dir"/*.png 2>/dev/null | head -n1)

# take screenshot
hyprshot -m region -o "$output_dir" >/dev/null 2>&1 &

# wait for a new file to appear
new_file=""
for i in {1..20}; do  # wait up to 2 seconds (20 * 0.1)
    file=$(ls -t "$output_dir"/*.png 2>/dev/null | head -n1)
    if [[ "$file" != "$last_file" && -n "$file" ]]; then
        new_file="$file"
        break
    fi
    sleep 0.1
done

if [[ -z "$new_file" ]]; then
    echo "Error: No new screenshot file found"
    exit 1
fi

clipboard_file="$new_file"
if [[ "$clipboard_file" == $HOME* ]]; then
    clipboard_file="~${clipboard_file#$HOME}"
fi

# copy path to clipboard
echo -n "$clipboard_file" | wl-copy
echo -n "$clipboard_file" | xclip -selection clipboard

cliphist wipe
sleep 0.1
echo -n "$clipboard_file" | cliphist store

echo "Saved: $clipboard_file"
