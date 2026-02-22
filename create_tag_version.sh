#!/bin/bash

VERSION=$(awk '/^version:/ {print $2}' pubspec.yaml)
echo "Version: v$VERSION"

echo "Creating tag..."
git tag -a v$VERSION -m "Prepare $VERSION release"

echo "Pushing tag..."
git push origin v$VERSION