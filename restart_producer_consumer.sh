#!/bin/bash
echo "delete and restart producer and consumer"
kubectl delete deployment kafka-producer
kubectl delete deployment kafka-consumer
kubectl apply -f producer-deployment.yaml
kubectl apply -f consumer-deployment.yaml