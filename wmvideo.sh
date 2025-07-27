#!/bin/bash

# Check if an input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input_video>"
    exit 1
fi

# Input file name (without extension)
input_base="$1"

# Check for input file with .mp4 or .m4v extension
input_file=""
if [ -f "${input_base}.mp4" ]; then
    input_file="${input_base}.mp4"
    extension="mp4"
elif [ -f "${input_base}.m4v" ]; then
    input_file="${input_base}.m4v"
    extension="m4v"
else
    echo "Error: Input file '${input_base}.mp4' or '${input_base}.m4v' does not exist."
    exit 1
fi

# Watermark file
watermark_file="watermark.png"

# Check if watermark file exists
if [ ! -f "$watermark_file" ]; then
    echo "Error: Watermark file '$watermark_file' does not exist."
    exit 1
fi

# Output file with wm_ prefix
output_file="wm_$(basename "${input_base}").${extension}"

# FFmpeg command to add watermark (top-left, original size, no offset)
ffmpeg -i "$input_file" -i "$watermark_file" -filter_complex "overlay=0:0" -codec:a copy "$output_file"

# Check if FFmpeg command was successful
if [ $? -eq 0 ]; then
    echo "Watermark added successfully. Output saved to $output_file"
else
    echo "Error: Failed to process the video."
    exit 1
fi
