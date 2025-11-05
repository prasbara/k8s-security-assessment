#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

# Define base directories
BASE_DIR=$(realpath "$(dirname "$0")/..")
ARTIFACTS_DIR="$BASE_DIR/artifacts/raw"
SCANS_DIR="$BASE_DIR/scans"
REPORTS_DIR="$BASE_DIR/artifacts/summary"

# Ensure artifact directories exist
mkdir -p "$ARTIFACTS_DIR"
mkdir -p "$REPORTS_DIR"

echo "--- Starting Full Security Scan ---"
date

# --- Run Scans ---
echo
echo "[*] Running Kube-Hunter..."
bash "$SCANS_DIR/kube-hunter/run-kube-hunter.sh" > "$ARTIFACTS_DIR/kube-hunter_output.txt" 2>&1
echo "Kube-Hunter scan saved to artifacts/raw/kube-hunter_output.txt"

echo
echo "[*] Running Kube-Bench..."
bash "$SCANS_DIR/kube-bench/run-kube-bench.sh" > "$ARTIFACTS_DIR/kube-bench_output.txt" 2>&1
echo "Kube-Bench instructions saved to artifacts/raw/kube-bench_output.txt"

echo
echo "[*] Running Kubescape..."
# Run kubescape and move its output to the artifacts directory
(cd "$SCANS_DIR/kubescape" && bash run-kubescape.sh)
mv "$SCANS_DIR/kubescape/results.json" "$ARTIFACTS_DIR/kubescape_nsa_results.json"
mv "$SCANS_DIR/kubescape/mitre-results.json" "$ARTIFACTS_DIR/kubescape_mitre_results.json"
echo "Kubescape scans saved to artifacts/raw/"

echo
echo "[*] Running Trivy Image Scan..."
bash "$SCANS_DIR/trivy/scan-images.sh" > "$ARTIFACTS_DIR/trivy_image_scan_output.txt" 2>&1
echo "Trivy scan saved to artifacts/raw/trivy_image_scan_output.txt"

# --- Final Steps ---
echo
echo "[*] Running artifact collection..."
bash "$BASE_DIR/scripts/collect_artifacts.sh"

echo
echo "[*] Generating summary report..."
bash "$BASE_DIR/scripts/report_generate.sh"

echo
echo "--- Full Security Scan Finished ---"
date
echo "Raw reports are in $ARTIFACTS_DIR"
echo "Summary report is in $REPORTS_DIR"
