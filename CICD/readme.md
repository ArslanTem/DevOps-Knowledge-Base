# 🚀 Azure DevOps CI/CD Showcase

This repository demonstrates **basic CI/CD pipelines using Azure DevOps** and **Terraform-based infrastructure provisioning**.

## 📂 Project Structure
- `pipelines/` → YAML files for CI/CD workflows.
- `terraform/` → Simple infrastructure as code (IaC) examples.

---

## **🌍 1️⃣ Simple Web App Deployment**
📌 **Technology Stack**:
- **Terraform** → Defines an **Azure App Service**
- **Azure DevOps** → Builds & deploys the app

📜 **Terraform files (`terraform/simple-webapp/`)**
- `main.tf` → Defines the App Service.
- `variables.tf` → Configures inputs.
- `outputs.tf` → Provides output values.

📜 **CI/CD Pipeline (`pipelines/deploy-app.yaml`)**
```yaml
trigger:
  - main

pool:
  vmImage: 'ubuntu-latest'

stages:
  - stage: Build
    jobs:
      - job: Build
        steps:
          - script: echo "Building App..."
  
  - stage: Deploy
    jobs:
      - job: Deploy
        steps:
          - script: echo "Deploying App..."
