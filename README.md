# video-postprocess

This repository has various utility scripts that help with video post processing



### General Prerequisites
- **FFmpeg**: Install FFmpeg on your system.
  - **Windows**: Use `winget install ffmpeg` or download from [FFmpeg's website](https://ffmpeg.org/download.html).
  - **macOS**: Install via Homebrew: `brew install ffmpeg`.
  - **Linux**: Install via package manager, e.g., `sudo apt-get install ffmpeg` (Debian/Ubuntu).
  - Verify installation: `ffmpeg -version`.
 - **Bash**: A Bash-compatible shell (available on Linux/macOS; use Git Bash or WSL on Windows).




 
## wmvideo.sh

wmvideo.sh is a simple bash script that adds a watermark image (`watermark.png`) to MP4 or M4V video files using `ffmpeg`. The watermark is placed in the top-left corner of the video at its original size with no offset. The output video is saved with a `wm_` prefix added to the input filename (e.g., `myvideo.mp4` becomes `wm_myvideo.mp4`).

### Features
- Supports input video files with `.mp4` or `.m4v` extensions.
- Accepts input filenames without requiring the extension (e.g., `myvideo` instead of `myvideo.mp4`).
- Places `watermark.png` in the top-left corner (0:0 offset) at its original size.
- Preserves the original audio stream without re-encoding for faster processing.
- Includes error handling for missing input files or watermark image.

### Prerequisites
Other than the general prereqs:
- **Watermark Image**: A `watermark.png` file (PNG with transparency recommended) in the same directory as the script.





## gifconvert.sh

gifconvert.sh is a simple Bash script to convert `.mp4` or `.m4v` video files to GIFs using `ffmpeg`. The script accepts a filename with or without an extension and generates a GIF with the same base name, sized at 640px width with 10 fps and infinite looping.

### Features
- Converts `.mp4` or `.m4v` files to GIFs.
- Accepts filenames with or without extensions (e.g., `gifconvert video` or `gifconvert video.mp4`).
- Outputs a 640px-wide GIF with high-quality Lanczos scaling.
- Simple error handling for missing files or invalid inputs.


## convert2mp4.sh

convert2mp4.sh is a simple Bash script that converts an M4V video file to MP4 format using FFmpeg, preserving the original video and audio codecs.

### Features 

- Check if a filename is provided
- Verify the input file exists
- Convert the M4V file to MP4 using FFmpeg
- Output the result as <original_filename>.mp4


## mp3tomp4.sh

mp3tomp4.sh is a simple Bash script that converts an mp3 audio file to MP4 format using FFmpeg and a static JPEG image. 

### Features 

- Accepts two inputs: the image and mp3 file base names without extensions
- Verifies the input files exist
- Converts the mp3 file to MP4 using FFmpeg
    - Uses the H.264 codec for video encoding
    - Encodes the audio to AAC for compatibility with MP4
    - Scales the image to 1920x1080 while preserving its aspect ratio and adds padding to center it.
- Outputs the result as <mp3_filename>.mp4
- Displays success or error messages
