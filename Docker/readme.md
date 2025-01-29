# Docker Showcase Repository

Welcome to my **Docker Showcase Repository**! 🚀 This repo demonstrates various **Docker use cases**, best practices, and real-world applications.

---

## 📂 Repository Structure

```
📦 docker-showcase
 ┣ 📂 basic-docker-commands
 ┃ ┣ 📜 README.md  ➝ Quick reference for Docker commands
 ┃ ┣ 📜 Dockerfile  ➝ Simple example of containerization
 ┃ ┗ 📜 docker-cheatsheet.md  ➝ List of useful commands
 ┣ 📂 multi-container-app
 ┃ ┣ 📜 README.md  ➝ Example using Docker Compose (Backend + DB)
 ┃ ┣ 📜 docker-compose.yml  ➝ Multi-container setup
 ┃ ┣ 📂 app  ➝ Sample Python/Node.js API
 ┃ ┗ 📂 db  ➝ PostgreSQL setup
 ┣ 📂 ci-cd-pipeline
 ┃ ┣ 📜 README.md  ➝ Guide to deploying Docker apps with CI/CD
 ┃ ┣ 📜 azure-pipelines.yml  ➝ Example pipeline for Azure DevOps
 ┃ ┗ 📜 Dockerfile  ➝ App to deploy
 ┣ 📜 .gitignore
 ┗ 📜 README.md  ➝ Main project overview
```

---

## 🔥 Getting Started with Docker


### Basic Commands
```bash
# Check Docker version
docker --version

# Run a basic container (Hello World)
docker run hello-world

# List running containers
docker ps

# List all containers (including stopped ones)
docker ps -a

# Stop a running container
docker stop <container_id>

# Remove a container
docker rm <container_id>

# Build an image from a Dockerfile
docker build -t myapp .

# Run a container from an image
docker run -d -p 8080:80 myapp
```

---

## 📌 Example: Simple Web Server in Docker

### Dockerfile (Node.js Example)
```dockerfile
# Use an official Node.js image
FROM node:18
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD ["node", "server.js"]
```

### Running the Container
```bash
# Build and run
docker build -t my-node-app .
docker run -d -p 3000:3000 my-node-app
```

---

## 🛠️ Docker Compose (Multi-Container Example)

### `docker-compose.yml`
```yaml
version: '3.8'
services:
  backend:
    image: my-backend:latest
    ports:
      - "5000:5000"
    depends_on:
      - db
  db:
    image: postgres:latest
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
```

```bash
# Start all services
docker-compose up -d
```

---

## 🔄 CI/CD Pipeline for Docker in Azure DevOps

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
```

---

## 📢 Contribute
If you have any improvements, feel free to open a pull request! 🚀
