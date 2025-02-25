# Docker & Kubernetes Learning Project

## Overview
This project is designed for learning **Docker** and **Kubernetes** by deploying web applications using **Nginx**. It covers various deployment methods, including **bare-metal setups**, **Docker containers**, and **Kubernetes clusters**. The project also demonstrates using **git-sync** to automatically update the web content.

## Directory Structure
```
Docker-K8s/
│── bare-metal/               # Scripts for setting up Nginx on a bare-metal server
│── k8s/                      # Kubernetes deployment configurations
│── www/                      # Web content directory
│   ├── images/               # Static assets
│   ├── src/                  # Source code of the website
│── docker-compose.yml        # Docker Compose file for multi-container setup
│── Dockerfile                # Dockerfile for building Nginx image
│── README.md                 # Project documentation
```

## Prerequisites
- **Linux Machine** (for bare-metal setup)
- **Docker & Docker Compose** (for containerized deployment)
- **Kubernetes (Minikube or a Cluster)** (for K8s deployment)
- **Git** (for repository management)

---
## Deployment Methods

### 1️⃣ Bare-Metal Deployment (Nginx on Linux)
This method installs and configures **Nginx** directly on a server.
```bash
cd bare-metal/
sudo bash setup-nginx.sh
```
- Installs **Nginx** and configures it to serve files from `www/src/`
- Starts the Nginx web server

---
### 2️⃣ Docker Deployment
This method runs **Nginx** inside a Docker container.
```bash
cd Docker-K8s/
docker build -t my-nginx .
docker run -d -p 8080:80 my-nginx
```
- **Dockerfile** copies `www/src/` into Nginx's default directory
- The website will be accessible at `http://localhost:8080`

#### Using Docker Compose (Multi-Container Setup)
```bash
docker compose up -d
```
- Runs multiple containers together, useful for a full-stack deployment

---
### 3️⃣ Kubernetes Deployment
This method deploys **Nginx** in a Kubernetes cluster.
```bash
cd k8s/
kubectl apply -f deploy.yml
kubectl apply -f svc.yml
```
- Deploys Nginx as a **Kubernetes Pod**
- Exposes the service via **LoadBalancer** or **NodePort**
- Verify deployment:
```bash
kubectl get pods
```

---
### 4️⃣ Git-Sync Sidecar (Auto-Update Web Content)
This setup enables real-time synchronization of web files using `git-sync`.
```bash
kubectl apply -f git-sync-sidecar.yml
```
- `git-sync` automatically pulls updates from the repository into `www/src/`
- Restarting Nginx will apply the latest changes

---
### 5️⃣ Kubernetes with Versioning (v1 & v2)
Switching between different versions of the website:
```bash
kubectl set image deployment about-me-deploy about-me-pod=starfall/docker-k8s:v2
```
- Updates the deployment to use the specified image version.
- Verify rollout:
```bash
kubectl rollout status deployment/about-me-deploy
```

---
## Accessing the Webpage
Once deployed, open a browser and go to:
```
http://localhost:30001
```
You should see the **webpage served by Nginx**.

---
Happy Learning! 🚀🎉

