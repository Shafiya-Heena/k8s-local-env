#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="dev"
SECRET_NAME="nginx-tls"
DOMAIN="nginx.local"

echo "👉 Generating self-signed certificate for ${DOMAIN}..."

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout tls.key \
  -out tls.crt \
  -subj "/CN=${DOMAIN}/O=local"

echo "🔐 Creating/updating TLS secret..."

kubectl create secret tls "${SECRET_NAME}" \
  --cert=tls.crt \
  --key=tls.key \
  -n "${NAMESPACE}" \
  --dry-run=client -o yaml | kubectl apply -f -

echo "🧹 Cleaning up local cert files..."
rm -f tls.key tls.crt

echo "✅ TLS setup complete"
