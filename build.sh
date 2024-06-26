#!/bin/bash
# Build script to copy src/ to public/

# Make sure file .genaitour exists in root directory
[ ! -f .genaitour ] && {
    printf "Error: .genaitour not found.\n" >&2
    exit 1
}

# Remove old files
printf "Removing old files...\n"
rm -rf public/*

# Build sites
printf "Building sites...\n"
npm run build