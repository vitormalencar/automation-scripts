#!/bin/bash

# check if the folder path is passed as an argument
if [ "$#" -ne 1 ]; then
    echo "Please provide the folder path as an argument."
    exit 1
fi

folder_path=$1

# check if the folder exists
if [ ! -d "$folder_path" ]; then
    echo "The folder does not exist."
    exit 1
fi

# create the output folder
output_folder="${folder_path}_remuxed"
mkdir "$output_folder"

# loop through all video files in the folder
for file in "$folder_path"/*; do
    # check if the file is a video file
    if [ "${file##*.}" = "mkv" ] || [ "${file##*.}" = "mp4" ] || [ "${file##*.}" = "avi" ] || [ "${file##*.}" = "flv" ]; then
        filename="$(basename "$file")"
        echo "Remuxing $filename..."
        ffmpeg -i "$file" -c copy "$output_folder/${filename%.*}_remuxed.mkv"

        # calculate the progress
        processed_size=$(stat -f %z "$output_folder/${filename%.*}_remuxed.mkv")
        total_size=$(stat -f %z "$file")
        progress=$((100 * processed_size / total_size))
        echo "Progress: $progress%"
    fi
done

echo "Remuxing complete."
