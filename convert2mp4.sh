#!/bin/bash

# Check if filename is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a filename"
    echo "Usage: $0 input.m4v"
    exit 1
fi

# Check if input file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found"
    exit 1
fi

# Get the filename without extension
filename=$(basename "$1" .m4v)

# Run ffmpeg command
ffmpeg -i "$1" -vcodec copy -acodec copy "${filename}.mp4"

# Check if ffmpeg command was successful
if [ $? -eq 0 ]; then
    echo "Conversion successful: ${filename}.mp4 created"
else
    echo "Error: Conversion failed"
    exit 1
fi
