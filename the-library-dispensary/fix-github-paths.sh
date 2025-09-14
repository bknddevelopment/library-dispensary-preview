#!/bin/bash

# Fix paths for GitHub Pages deployment
# This script fixes the asset paths in the Next.js static export

echo "Fixing asset paths for GitHub Pages deployment..."

BASE_PATH="/library-dispensary-preview"
OUT_DIR="./out"

# Find all HTML files in the out directory
find "$OUT_DIR" -name "*.html" -type f | while read -r file; do
    echo "Processing: $file"

    # Create a temporary file
    temp_file="${file}.tmp"

    # Fix _next paths (CSS, JS, fonts)
    sed -e "s|href=\"/_next/|href=\"${BASE_PATH}/_next/|g" \
        -e "s|src=\"/_next/|src=\"${BASE_PATH}/_next/|g" \
        -e "s|\"/_next/|\"${BASE_PATH}/_next/|g" \
        "$file" > "$temp_file"

    # Move the temporary file to replace the original
    mv "$temp_file" "$file"
done

echo "Asset paths fixed successfully!"
echo ""
echo "Files have been updated with the correct basePath: ${BASE_PATH}"
echo ""
echo "Next steps:"
echo "1. Copy the 'out' directory contents to your GitHub repository"
echo "2. Commit and push to GitHub"
echo "3. GitHub Pages will serve the site at: https://bknddevelopment.github.io${BASE_PATH}/"