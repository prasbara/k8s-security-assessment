#!/bin/bash
echo "Running Kubescape to scan for misconfigurations..."
# Scans the cluster against the NSA and MITRE ATT&CK frameworks.
# Outputs in JSON format.
kubescape scan framework nsa --format json --output results.json
kubescape scan framework mitre --format json --output mitre-results.json
echo "Kubescape scan complete. Results saved to results.json and mitre-results.json."
