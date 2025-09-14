#!/bin/bash

# Deploy script for The Library Dispensary to GitHub Pages
# This script deploys the fixed static build to the GitHub repository

echo "========================================="
echo "GitHub Pages Deployment Script"
echo "========================================="
echo ""

# Configuration
GITHUB_REPO="bknddevelopment/library-dispensary-preview"
OUT_DIR="./out"
TEMP_DIR="/tmp/library-deploy-$(date +%s)"

echo "Preparing deployment for: $GITHUB_REPO"
echo ""

# Clone the repository to a temporary directory
echo "1. Cloning GitHub repository..."
git clone "https://github.com/${GITHUB_REPO}.git" "$TEMP_DIR"

if [ $? -ne 0 ]; then
    echo "Error: Failed to clone repository. Please check your GitHub credentials."
    exit 1
fi

# Remove all existing files except .git
echo "2. Cleaning existing files..."
cd "$TEMP_DIR"
find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} \;

# Copy the new build files
echo "3. Copying new build files..."
cp -r "$OLDPWD/$OUT_DIR/"* .
cp -r "$OLDPWD/$OUT_DIR/".nojekyll . 2>/dev/null || echo "   .nojekyll already exists or not found"

# Add all files to git
echo "4. Staging changes..."
git add -A

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    echo "No changes to deploy."
    rm -rf "$TEMP_DIR"
    exit 0
fi

# Commit changes
echo "5. Committing changes..."
git commit -m "Deploy fixed build with correct asset paths for GitHub Pages

- Fixed all _next asset paths to include basePath
- Added .nojekyll file to prevent Jekyll processing
- All CSS, JS, and font paths now correctly prefixed with /library-dispensary-preview"

# Push to GitHub
echo "6. Pushing to GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================="
    echo "✅ Deployment Successful!"
    echo "========================================="
    echo ""
    echo "Your site will be available at:"
    echo "https://bknddevelopment.github.io/library-dispensary-preview/"
    echo ""
    echo "Note: GitHub Pages may take a few minutes to update."
    echo "You can check the deployment status at:"
    echo "https://github.com/${GITHUB_REPO}/actions"
else
    echo ""
    echo "❌ Deployment failed. Please check your GitHub credentials and try again."
    exit 1
fi

# Clean up
rm -rf "$TEMP_DIR"

echo ""
echo "Deployment complete!"