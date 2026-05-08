#!/bin/bash
set -e

echo "Creating cluster..."
kind create cluster --name my-local-cluster --config infra/my-cluster.yaml
