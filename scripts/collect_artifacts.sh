#!/bin/bash
BASE_DIR=$(realpath "$(dirname "$0")/..")
ARTIFACTS_DIR="$BASE_DIR/artifacts"
RAW_DIR="$ARTIFACTS_DIR/raw"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
ARCHIVE_FILE="$ARTIFACTS_DIR/scan-artifacts-$TIMESTAMP.tar.gz"

echo "Collecting raw artifacts from $RAW_DIR..."
if [ -z "$(ls -A $RAW_DIR)" ]; then
   echo "No artifacts found in $RAW_DIR to collect."
   exit 0
fi

tar -czf "$ARCHIVE_FILE" -C "$RAW_DIR" .

echo "Artifacts archived to $ARCHIVE_FILE"
