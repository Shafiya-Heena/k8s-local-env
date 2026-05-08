# 🚀 Kubernetes Local Environment Bootstrap

A reproducible, YAML-driven Kubernetes setup for local development using Docker and kind.
This repository demonstrates how to bootstrap a Kubernetes cluster and deploy applications using declarative manifests — aligned with real-world DevOps and SRE practices.


## 📌 Overview

This project provides:

* Local Kubernetes cluster setup (using kind / Docker Desktop)
* Fully declarative Kubernetes manifests (YAML-based)
* Namespace-based workload isolation
* Sample application deployment (NGINX)
* Service exposure and local access via port-forward
* Config management using ConfigMaps and Secrets
* Scripted workflow for cluster lifecycle and deployments


## 🏗️ Architecture

```text
Local Machine (macOS)
   ↓
Docker
   ↓
Kubernetes Cluster (kind / Docker Desktop)
   ↓
Namespace (dev)
   ↓
Deployment → Pods → Container (nginx)
   ↓
Service (ClusterIP)
   ↓
kubectl port-forward → localhost:8080
```


## 📂 Repository Structure

```text
.
├── infra/
│   └── kind-cluster.yaml        # Cluster configuration (multi-node)
│
├── k8s/
│   ├── namespace.yaml           # Namespace definition
│   ├── deployment.yaml          # Application deployment
│   ├── service.yaml             # Service exposure
│   ├── configmap.yaml           # App configuration
│   └── secret.yaml              # Sensitive data (dev only)
│
├── scripts/
│   ├── create-cluster.sh        # Create local cluster
│   ├── deploy.sh                # Apply all manifests
│   └── cleanup.sh               # Delete cluster
│
└── README.md
```


## ⚙️ Prerequisites

Ensure the following are installed:

* Docker Desktop
* kubectl
* kind (if not using Docker Desktop Kubernetes)


## 🚀 Getting Started

### 1. Create Kubernetes Cluster

```bash
./scripts/create-cluster.sh
```

### 2. Deploy Application

```bash
./scripts/deploy.sh
```

### 3. Verify Deployment

```bash
kubectl get all -n dev
```

### 4. Access Application

```bash
kubectl port-forward svc/nginx-app-service 8080:80 -n dev
```

Open in browser:

```
http://localhost:8080
```

### 5. Cleanup

```bash
./scripts/cleanup.sh
```

## 🧠 Key Concepts Demonstrated

* Declarative Kubernetes using YAML
* Namespace-based isolation
* Deployment and Replica management
* Service abstraction and load balancing
* ConfigMap and Secret usage
* Local cluster simulation using containerized nodes
* Separation of infrastructure and application layers


## 📈 Future Enhancements

* Helm chart integration
* Kustomize overlays (dev / staging / prod)
* Ingress controller setup
* GitOps (ArgoCD / Flux)
* Observability stack (Prometheus, Grafana, OpenTelemetry)
* External Secrets / Vault integration


## ⚠️ Notes

* Secrets in this repository are for **development purposes only**
* Do not store production secrets in plain YAML
* Use secure secret management solutions in real environments


## 👨‍💻 Author

Shafiya Heena
DevOps / SRE Engineer

---

## 📄 License

This project is for learning and demonstration purposes.
# k8s-local-env
Kubernetes local environment
