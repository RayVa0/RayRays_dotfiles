#!/bin/bash

#Thank you Claude Sonnet 4
# Image to Black & White Converter using FFmpeg
# Usage: ./convert_to_bw.sh <input_directory> [output_directory] [method]

# Function to display usage
show_usage() {
    echo "Usage: $0 <input_directory> [output_directory] [method]"
    echo ""
    echo "Arguments:"
    echo "  input_directory   : Directory containing images to convert"
    echo "  output_directory  : Directory to save converted images (optional, defaults to input_dir/bw_output)"
    echo "  method           : Conversion method (optional, defaults to 'gray')"
    echo ""
    echo "Available methods:"
    echo "  gray     - Simple grayscale conversion (fastest)"
    echo "  desaturate - Desaturation method (hue=s=0)"
    echo "  mixer    - Custom channel mixer for more control"
    echo ""
    echo "Examples:"
    echo "  $0 ./photos"
    echo "  $0 ./photos ./bw_photos"
    echo "  $0 ./photos ./bw_photos desaturate"
    echo ""
    echo "Supported formats: jpg, jpeg, png, tiff, tif, bmp, webp"
}

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed or not in PATH"
    exit 1
fi

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Error: Input directory is required"
    show_usage
    exit 1
fi

# Parse arguments
INPUT_DIR="$1"
OUTPUT_DIR="${2:-${INPUT_DIR}/bw_output}"
METHOD="${3:-desaturate}"

# Validate input directory
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Input directory '$INPUT_DIR' does not exist"
    exit 1
fi

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Creating output directory: $OUTPUT_DIR"
    mkdir -p "$OUTPUT_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create output directory"
        exit 1
    fi
fi

# Set filter based on method
case "$METHOD" in
    "gray")
        FILTER="format=gray"
        ;;
    "desaturate")
        FILTER="hue=s=0"
        ;;
    "mixer")
        FILTER="colorchannelmixer=.3:.4:.3:0:.3:.4:.3:0:.3:.4:.3"
        ;;
    *)
        echo "Error: Unknown method '$METHOD'"
        show_usage
        exit 1
        ;;
esac

echo "Converting images to black & white PNG with maximum compression..."
echo "Input directory: $INPUT_DIR"
echo "Output directory: $OUTPUT_DIR"
echo "Method: $METHOD"
echo "Filter: $FILTER"
echo ""

# Initialize counters
total_files=0
converted_files=0
skipped_files=0

# Supported file extensions
extensions=("jpg" "jpeg" "png" "tiff" "tif" "bmp" "webp" "JPG" "JPEG" "PNG" "TIFF" "TIF" "BMP" "WEBP")

# Process each supported file type
for ext in "${extensions[@]}"; do
    for file in "$INPUT_DIR"/*."$ext"; do
        # Skip if no files match the pattern
        [ ! -f "$file" ] && continue
        
        total_files=$((total_files + 1))
        
        # Get filename without path and extension
        filename=$(basename "$file")
        name_without_ext="${filename%.*}"
        file_ext="${filename##*.}"
        
        # Create output filename (always PNG)
        output_file="$OUTPUT_DIR/${name_without_ext}_bw.png"
        
        # Check if output file already exists
        if [ -f "$output_file" ]; then
            echo "Skipping $filename (output already exists)"
            skipped_files=$((skipped_files + 1))
            continue
        fi
        
        echo "Converting: $filename"
        
        # Convert the image to PNG with maximum lossless compression
        ffmpeg -i "$file" -vf "$FILTER" -compression_level 9 -pred mixed "$output_file" -y 2>/dev/null
        
        # Check if conversion was successful
        if [ $? -eq 0 ]; then
            converted_files=$((converted_files + 1))
            echo "- Converted to: $(basename "$output_file")"
        else
            echo "— Failed to convert: $filename"
        fi
    done
done

# Summary
echo ""
echo "Conversion completed!"
echo "Total files found: $total_files"
echo "Successfully converted: $converted_files"
echo "Skipped (already exist): $skipped_files"
echo "Failed: $((total_files - converted_files - skipped_files))"

if [ $total_files -eq 0 ]; then
    echo ""
    echo "No supported image files found in '$INPUT_DIR'"
    echo "Supported formats: ${extensions[*]} (all output as PNG)"
fi
