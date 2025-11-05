#!/bin/bash
IMAGE_NAME="vulnerable-image-with-secret:latest"
echo "Building a demo Docker image with a hardcoded secret..."
# This script builds the image defined in the Dockerfile.
# In a real scenario, you might push it to a registry.
docker build -t "$IMAGE_NAME" .
echo "Image '$IMAGE_NAME' built successfully."
echo "You can now run it or push it to a container registry."
