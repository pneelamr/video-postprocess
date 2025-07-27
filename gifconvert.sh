#!/bin/bash

# Check if an input file name is provided
if [ $# -ne 1 ]; then
    echo "Usage: gifconvert <filename>"
    exit 1
fi

# Store the input argument
input="$1"

# Remove any .mp4 or .m4v extension if provided
base_name=$(basename "$input" .mp4)
base_name=$(basename "$base_name" .m4v)

# Check for .mp4 or .m4v file
if [ -f "${base_name}.mp4" ]; then
    input_file="${base_name}.mp4"
elif [ -f "${base_name}.m4v" ]; then
    input_file="${base_name}.m4v"
else
    echo "Error: No .mp4 or .m4v file found for '$base_name'"
    exit 1
fi

# Set output file name
output_file="${base_name}.gif"

# Run ffmpeg command with larger size (640px width)
ffmpeg -i "$input_file" -vf "fps=10,scale=640:-1:flags=lanczos" -c:v gif -loop 0 "$output_file"

# Check if conversion was successful
if [ $? -eq 0 ]; then
    echo "Conversion successful: $output_file created"
else
    echo "Error: Conversion failed"
    exit 1
fi
