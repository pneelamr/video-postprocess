#!/bin/bash

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: FFmpeg is not installed. Please install it first."
    exit 1
fi

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image_base_name> <audio_base_name>"
    echo "Example: $0 image audio"
    exit 1
fi

# Assign input arguments to variables and append extensions
image_file="$1.jpg"
audio_file="$2.mp3"
output_file="output.mp4"

# Check if input files exist
if [ ! -f "$image_file" ]; then
    echo "Error: Image file '$image_file' does not exist."
    exit 1
fi

if [ ! -f "$audio_file" ]; then
    echo "Error: Audio file '$audio_file' does not exist."
    exit 1
fi

# Run FFmpeg command
ffmpeg -loop 1 -i "$image_file" -i "$audio_file" -c:v libx264 -c:a aac -shortest -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" "$output_file"

# Check if FFmpeg command was successful
if [ $? -eq 0 ]; then
    echo "Successfully created $output_file"
else
    echo "Error: Failed to create $output_file"
    exit 1
fi
