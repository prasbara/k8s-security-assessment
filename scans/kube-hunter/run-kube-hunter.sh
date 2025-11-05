#!/bin/bash
echo "Running Kube-Hunter to find security weaknesses..."
# Requires kube-hunter to be installed and kubectl configured.
# The --pod flag makes it run from within the cluster as a pod.
# Remove --pod if running from an external machine with cluster access.
kube-hunter
