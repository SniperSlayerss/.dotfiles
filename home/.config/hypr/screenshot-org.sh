#!/usr/bin/env bash

output_dir=~/org/images
mkdir -p "$output_dir"

# expand ~ early so we get a real path
output_dir=$(realpath "$output_dir")
last_file=$(ls -t "$output_dir"/*.png 2>/dev/null | head -n1 || true)

# take screenshot synchronously (no &)
hyprshot -m region -o "$output_dir"

# wait for a new file
new_file=""
for i in {1..50}; do  # wait up to 5 seconds
    file=$(ls -t "$output_dir"/*.png 2>/dev/null | head -n1 || true)
    if [[ "$file" != "$last_file" && -n "$file" ]]; then
        new_file="$file"
        break
    fi
    sleep 0.1
done

if [[ -z "$new_file" ]]; then
    echo "Error: no new screenshot file found"
    exit 1
fi

# copy to clipboard for convenience
echo -n "$new_file" | wl-copy

# save path to file (use full absolute path)
echo "$new_file" > "$HOME/.last_screenshot_path"

echo "Saved: ${new_file/#$HOME/~}"
