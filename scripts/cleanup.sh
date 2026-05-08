#!/bin/bash
set -e

echo "Deleting cluster..."
kind delete cluster --name my-local-cluster
