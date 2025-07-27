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

