#!/bin/bash
set -e  # exit on error

# Ask user for version
read -p "Enter the release version (e.g., 1.0.0): " VERSION

if [[ -z "$VERSION" ]]; then
  echo "No version entered. Exiting."
  exit 1
fi

# Update submodules
git submodule update --remote

# Commit changes
git add .
git commit -m "New version release v$VERSION" || echo "No changes to commit."

# Push changes
git push origin main

# Create and push tag
TAG="v$VERSION"
git tag "$TAG"
git push origin "$TAG"

echo "Release $TAG pushed successfully"