#!/usr/bin/env bash
# Find script files
for file in scripts/*.sh; do
  echo "Checking $file"
  # Look for error messages without the X emoji
  grep -n "echo \"ERROR:" "$file" || true
  grep -n "echo \"Error:" "$file" || true
done
