# 🚀 Kubernetes Local Environment Bootstrap

A reproducible, YAML-driven Kubernetes setup for local development using Docker and kind.
This repository demonstrates how to bootstrap a Kubernetes cluster and deploy applications using declarative manifests — aligned with real-world DevOps and SRE practices.


## 📌 Overview

This project provides:

* Local Kubernetes cluster setup (using kind / Docker Desktop)
* Fully declarative Kubernetes manifests (YAML-based)
* Namespace-based workload isolation
* Sample application deployment (NGINX)
* Service exposure via **Ingress (no port-forward required)**
* Config management using ConfigMaps and Secrets
* Scripted workflow for cluster lifecycle and deployments


## 🏗️ Architecture

```text
Local Machine (macOS)
   ↓
Docker
   ↓
Kubernetes Cluster (kind)
   ↓
Namespace (dev)
   ↓
Deployment → Pods → Container (nginx)
   ↓
Service (ClusterIP)
   ↓
Ingress Controller (NGINX)
   ↓
http://nginx.local
```

## 📂 Repository Structure

```text
.
├── infra/
│   └── my-cluster.yaml        # Cluster configuration (multi-node + port mapping)
│
├── k8s/
│   ├── namespace.yaml           # Namespace definition
│   ├── deployment.yaml          # Application deployment
│   ├── service.yaml             # Service exposure
│   ├── configmap.yaml           # App configuration
│   ├── secret.yaml              # Sensitive data (dev only)
│   └── ingress.yaml             # Ingress routing
│
├── scripts/
│   ├── create-cluster.sh        # Create local cluster
│   ├── setup-ingress.sh         # Install ingress controller
│   ├── deploy.sh                # Apply all manifests
│   └── cleanup.sh               # Delete cluster
│
└── README.md
```


## ⚙️ Prerequisites

Ensure the following are installed:

* Docker Desktop
* kubectl
* kind


## 🚀 Getting Started

### 1. Create Kubernetes Cluster

```bash
./scripts/create-cluster.sh
```

### 2. Install Ingress Controller

```bash
./scripts/setup-ingress.sh
```

Verify:

```bash
kubectl get pods -n ingress-nginx
```

### 3. Deploy Application

```bash
./scripts/deploy.sh
```

### 4. Configure Local DNS

Update your `/etc/hosts` file:

```bash
sudo vi /etc/hosts
```

Add:

```text
127.0.0.1 nginx.local
```

### 5. Access Application

Open in browser:

```text
http://nginx.local
```

Or test via CLI:

```bash
curl http://nginx.local
```

### 6. Cleanup

```bash
./scripts/cleanup.sh
```

## 🧠 Key Concepts Demonstrated

* Declarative Kubernetes using YAML
* Namespace-based isolation
* Deployment and Replica management
* Service abstraction and load balancing
* Ingress-based traffic routing (Layer 7)
* ConfigMap and Secret usage
* Local cluster simulation using containerized nodes
* Separation of infrastructure and application layers


## 📈 Future Enhancements

* HTTPS (TLS) with Ingress
* Helm chart integration
* Kustomize overlays (dev / staging / prod)
* GitOps (ArgoCD / Flux)
* Observability stack (Prometheus, Grafana, OpenTelemetry)
* External Secrets / Vault integration


## ⚠️ Notes

* Secrets in this repository are for **development purposes only**
* Do not store production secrets in plain YAML
* Use secure secret management solutions in real environments


## 📄 License

This project is for learning and demonstration purposes.

