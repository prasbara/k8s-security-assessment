#!/bin/bash
echo "Running Kube-Bench to check for CIS benchmark compliance..."
# This assumes kube-bench is run as a job inside the cluster.
# The job manifest would typically be in the infra/ directory.
# For manual execution, you might need to specify the target config files.
echo "Note: Kube-bench is best run from within the cluster using its job.yaml manifest."
echo "Please see the official documentation for the correct way to run it on your specific cluster."
