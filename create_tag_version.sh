#!/bin/bash

VERSION=$(awk '/^version:/ {print $2}' pubspec.yaml)
echo "Version: v$VERSION"

echo "Creating tag..."
git tag v$VERSION

echo "Pushing tag..."
git push origin v$VERSION