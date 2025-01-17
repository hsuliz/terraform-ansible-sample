#!/bin/bash

FILE="build.gradle.kts"
UPDATE_TYPE="$1"

if [[ -z "$UPDATE_TYPE" ]]; then
  echo "Usage: $0 <major|minor|patch>"
  exit 1
fi

CURRENT_VERSION=$(grep '^version =' "$FILE" | sed -E 's/version = "([0-9]+\.[0-9]+\.[0-9]+)"/\1/')
if [[ -z "$CURRENT_VERSION" ]]; then
  echo "Error: Could not find a version in $FILE."
  exit 1
fi

IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

case "$UPDATE_TYPE" in
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
    ;;
  patch)
    PATCH=$((PATCH + 1))
    ;;
  *)
    echo "Error: Invalid update type '$UPDATE_TYPE'. Use 'major', 'minor', or 'patch'."
    exit 1
    ;;
esac

NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"
# For mac os
#sed -i '' "s/^version = \"[0-9.]*\"/version = \"$NEW_VERSION\"/" "$FILE"
sed -i "s/^version = \"[0-9.]*\"/version = \"$NEW_VERSION\"/" "$FILE"
echo "$NEW_VERSION"
