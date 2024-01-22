#!/bin/bash

# Build and push producer image
echo "Building and pushing producer image..."
docker build -f Dockerfile.producer -t mahimanzum/producer-image:latest .
docker push mahimanzum/producer-image:latest

# Build and push consumer image
echo "Building and pushing consumer image..."
docker build -f Dockerfile.consumer -t mahimanzum/consumer-image:latest .
docker push mahimanzum/consumer-image:latest

echo "Done."
