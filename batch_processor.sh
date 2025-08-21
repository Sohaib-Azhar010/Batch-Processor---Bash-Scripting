#!/bin/bash

read -p "Enter the folder path: " folder

if [ ! -d "$folder" ]; then
    echo "Folder does not exist."
    exit 1
fi

desktop="$HOME/Desktop"
date_str=$(date +%F)
count=0

for file in "$folder"/*.txt; do
    if [ -f "$file" ]; then
        base=$(basename "$file" .txt)
        newname="${base}_${date_str}.txt"
        cp "$file" "$desktop/$newname"
        rm "$file"
        ((count++))
    fi
done

echo "Processed $count files. Copied to Desktop and deleted originals."