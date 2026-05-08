#!/bin/bash
set -e

echo "Deploying resources..."

kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/
