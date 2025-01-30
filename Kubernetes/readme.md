# Kubernetes Showcase Repository

Welcome to my **Kubernetes Showcase Repository**! 🚀 This repo demonstrates various **Kubernetes use cases**, best practices, and real-world applications.

---

## 📂 Repository Structure

```
📦 kubernetes-showcase
 ┣ 📂 basic-k8s-commands
 ┃ ┣ 📜 README.md  ➝ Quick reference for Kubernetes commands
 ┃ ┣ 📜 k8s-cheatsheet.md  ➝ List of useful commands
 ┣ 📂 single-app-deployment
 ┃ ┣ 📜 README.md  ➝ Guide to deploying a simple app
 ┃ ┣ 📜 deployment.yaml  ➝ Kubernetes Deployment
 ┃ ┣ 📜 service.yaml  ➝ Kubernetes Service
 ┣ 📂 multi-service-app
 ┃ ┣ 📜 README.md  ➝ Example using multiple services (Frontend + Backend + DB)
 ┃ ┣ 📜 frontend-deployment.yaml
 ┃ ┣ 📜 backend-deployment.yaml
 ┃ ┣ 📜 db-deployment.yaml
 ┃ ┣ 📜 service.yaml  ➝ LoadBalancer service
 ┣ 📂 helm-chart
 ┃ ┣ 📜 README.md  ➝ Guide to deploying with Helm
 ┃ ┣ 📜 Chart.yaml  ➝ Helm chart metadata
 ┃ ┣ 📜 values.yaml  ➝ Configuration values
 ┣ 📂 ci-cd-pipeline
 ┃ ┣ 📜 README.md  ➝ Guide to deploying Kubernetes apps with CI/CD
 ┃ ┣ 📜 azure-pipelines.yml  ➝ Example pipeline for Azure DevOps
 ┣ 📜 .gitignore
 ┗ 📜 README.md  ➝ Main project overview
```

---

## 🔥 Getting Started with Kubernetes

### Install Kubernetes
- **Minikube** (Local Cluster): [Installation Guide](https://minikube.sigs.k8s.io/docs/start/)
- **kubectl** (Kubernetes CLI): [Installation Guide](https://kubernetes.io/docs/tasks/tools/)
- **Kubernetes on Azure (AKS)**: [Setup Guide](https://docs.microsoft.com/en-us/azure/aks/)

### Basic Commands
```bash
# Check Kubernetes version
kubectl version --client

# List all running pods
kubectl get pods

# List services
kubectl get services

# Deploy an application
kubectl apply -f deployment.yaml

# Get logs from a pod
kubectl logs <pod-name>

# Delete a deployment
kubectl delete deployment <deployment-name>
```

---

## 📌 Example: Simple App Deployment

### `deployment.yaml`
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: myapp:latest
        ports:
        - containerPort: 8080
```

### `service.yaml`
```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer
```

```bash
# Deploy the application
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

---

## 🛠️ Multi-Service Application (Frontend + Backend + Database)

### `frontend-deployment.yaml`
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: frontend
  template:
    metadata:
      labels:
        app: frontend
    spec:
      containers:
      - name: frontend
        image: myfrontend:latest
        ports:
        - containerPort: 80
```

### `backend-deployment.yaml`
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
      - name: backend
        image: mybackend:latest
        ports:
        - containerPort: 5000
```

### `db-deployment.yaml`
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: database
spec:
  replicas: 1
  selector:
    matchLabels:
      app: database
  template:
    metadata:
      labels:
        app: database
    spec:
      containers:
      - name: database
        image: postgres:latest
        env:
        - name: POSTGRES_USER
          value: "user"
        - name: POSTGRES_PASSWORD
          value: "password"
```

```bash
# Deploy all services
kubectl apply -f frontend-deployment.yaml
kubectl apply -f backend-deployment.yaml
kubectl apply -f db-deployment.yaml
```

---

## 🔄 CI/CD Pipeline for Kubernetes in Azure DevOps

### `azure-pipelines.yml`
```yaml
trigger:
  branches:
    include:
      - main
pool:
  vmImage: 'ubuntu-latest'
steps:
- task: Docker@2
  inputs:
    command: 'buildAndPush'
    repository: 'myacr.azurecr.io/myapp'
    dockerfile: '**/Dockerfile'
    containerRegistry: 'my-service-connection'

- task: KubernetesManifest@0
  inputs:
    action: 'deploy'
    namespace: 'default'
    manifests: '**/*.yaml'
    kubernetesServiceConnection: 'my-k8s-service-connection'
```

---

## 📢 Contribute
If you have any improvements, feel free to open a pull request! 🚀