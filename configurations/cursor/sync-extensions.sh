#!/usr/bin/env bash

# Directory where extensions will be stored
EXTENSIONS_FILE="$(dirname "$0")/extensions.txt"

# Get list of installed extensions
cursor --list-extensions >"$EXTENSIONS_FILE"

echo "Cursor extensions synced successfully!"
