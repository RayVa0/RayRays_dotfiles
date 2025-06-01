#!/bin/bash

dir="${1:-.}"
pic=$(find "$dir" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.bmp" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)

if [ -n "$pic" ]; then
    chafa -c full "$pic"
else
    echo "No image files found in $dir"
fi
