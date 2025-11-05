#!/bin/bash
BASE_DIR=$(realpath "$(dirname "$0")/..")
RAW_DIR="$BASE_DIR/artifacts/raw"
SUMMARY_DIR="$BASE_DIR/artifacts/summary"
REPORT_FILE="$SUMMARY_DIR/full_report.txt"

echo "Generating a combined text report from all raw outputs..."
# Ensure summary directory exists
mkdir -p "$SUMMARY_DIR"

# Clear old report
> "$REPORT_FILE"

for file in "$RAW_DIR"/*; do
  if [ -f "$file" ]; then
    echo "======================================================================" >> "$REPORT_FILE"
    echo "==================== $(basename "$file") ====================" >> "$REPORT_FILE"
    echo "======================================================================" >> "$REPORT_FILE"
    cat "$file" >> "$REPORT_FILE"
    echo -e "

" >> "$REPORT_FILE"
  fi
done

echo "Combined text report generated at $REPORT_FILE"
echo "Note: For an HTML report, a dedicated reporting tool should be used to parse the JSON outputs."
