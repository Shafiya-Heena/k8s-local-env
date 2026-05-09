#!/usr/bin/env bash
set -euo pipefail

echo "👉 Installing NGINX Ingress Controller..."

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo "⏳ Waiting for ingress controller to be ready..."

kubectl wait \
  --namespace ingress-nginx \
  --for=condition=Ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s

echo "✅ Ingress controller is ready"

echo ""
echo "👉 Verifying ingress controller pods:"
kubectl get pods -n ingress-nginx

echo ""
echo "👉 Verifying ingress controller service:"
kubectl get svc -n ingress-nginx
