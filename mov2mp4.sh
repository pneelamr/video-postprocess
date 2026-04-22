#!/bin/bash
# Simple Bash script to convert .mov (or .MOV) files to .mp4
# Uses ffmpeg with stream copy (-c copy) — fastest method, no quality loss, no re-encoding.
# Requires ffmpeg to be installed (brew install ffmpeg on macOS; apt install ffmpeg on Linux).

if [ $# -eq 0 ]; then
  echo "Usage: $0 <input.mov> [input2.mov ...]"
  echo "       or drag-and-drop multiple files onto the script."
  echo ""
  echo "Example:"
  echo "  $0 video.mov"
  echo "  $0 *.mov"
  exit 1
fi

for file in "$@"; do
  if [[ ! -f "$file" ]]; then
    echo "Error: File not found → $file"
    continue
  fi

  # Only process actual .mov/.MOV files
  if [[ "$file" =~ \.[mM][oO][vV]$ ]]; then
    output="${file%.*}.mp4"
    
    echo "Converting: $file → $output"
    
    # -movflags +faststart makes the file streamable (web-friendly)
    ffmpeg -i "$file" -c:v copy -c:a copy -movflags +faststart "$output" && \
      echo "✓ Done: $output" || \
      echo "✗ Failed: $file"
  else
    echo "Skipping (not a .mov file): $file"
  fi
done

echo "Conversion complete."
