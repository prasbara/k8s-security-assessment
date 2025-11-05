#!/bin/bash
echo "Running Trivy to scan all container images in the cluster..."
# Get all unique image names, excluding the kube-system namespace
IMAGES=$(kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" | \
tr -s '[[:space:]]' '\n' | \
sort | \
uniq)

if [ -z "$IMAGES" ]; then
  echo "No container images found to scan."
  exit 0
fi

echo "Found images to scan:"
echo "$IMAGES"
echo "---"

# Scan each image
for IMAGE in $IMAGES; do
  echo "Scanning image: $IMAGE"
  trivy image --severity HIGH,CRITICAL "$IMAGE"
  echo "---"
done
