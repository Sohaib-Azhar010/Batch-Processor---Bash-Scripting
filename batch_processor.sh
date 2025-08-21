#!/bin/bash

# Assignment 3: Batch Processor
# Write a bash script that:
# Asks the user for a folder path.
# Finds all .txt files in that folder.
# Copies them all to the Desktop.
# Appends today’s date (YYYY-MM-DD) to each copied file’s name.
# Example: report.txt → report_2025-08-20.txt.
# Deletes all the original .txt files from the given folder.
# : Show a summary at the end like:
# Processed 5 files. Copied to Desktop and deleted originals.


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