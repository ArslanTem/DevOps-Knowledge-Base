# Terraform Showcase Repository

Welcome to my **Terraform Showcase Repository**! 🚀 This repo demonstrates various **Terraform use cases**, best practices, and real-world Infrastructure as Code (IaC) projects.

---

## 📂 Repository Structure

```
📦 terraform-showcase
 ┣ 📂 basic-terraform-commands
 ┃ ┣ 📜 README.md  ➝ Quick reference for Terraform commands
 ┃ ┣ 📜 terraform-cheatsheet.md  ➝ List of useful commands
 ┣ 📂 simple-vm-deployment
 ┃ ┣ 📜 README.md  ➝ Guide to deploying a VM
 ┃ ┣ 📜 main.tf  ➝ Terraform configuration file
 ┃ ┣ 📜 variables.tf  ➝ Input variables
 ┃ ┣ 📜 outputs.tf  ➝ Output values
 ┣ 📂 modules
 ┃ ┣ 📜 README.md  ➝ Guide to using Terraform modules
 ┃ ┣ 📂 networking
 ┃ ┃ ┣ 📜 main.tf  ➝ Network module
 ┃ ┣ 📂 compute
 ┃ ┃ ┣ 📜 main.tf  ➝ Compute module
 ┣ 📂 ci-cd-pipeline
 ┃ ┣ 📜 README.md  ➝ Guide to deploying Terraform with CI/CD
 ┃ ┣ 📜 azure-pipelines.yml  ➝ Example pipeline for Azure DevOps
 ┣ 📜 .gitignore
 ┗ 📜 README.md  ➝ Main project overview
```

---

## 🔥 Getting Started with Terraform

### Install Terraform
- **Download Terraform**: [Installation Guide](https://developer.hashicorp.com/terraform/downloads)
- **Verify Installation**
```bash
terraform -v
```

### Basic Terraform Commands
```bash
# Initialize Terraform
terraform init

# Format and validate Terraform files
terraform fmt
terraform validate

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply -auto-approve

# Destroy the infrastructure
terraform destroy -auto-approve
```

---

## 📌 Example: Simple VM Deployment on Azure

### `main.tf`
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}
```

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the deployment
terraform apply -auto-approve
```

---

## 🔄 CI/CD Pipeline for Terraform in Azure DevOps

### `azure-pipelines.yml`
```yaml
trigger:
  branches:
    include:
      - main
pool:
  vmImage: 'ubuntu-latest'
steps:
- task: TerraformInstaller@0
  inputs:
    terraformVersion: 'latest'

- task: TerraformCLI@0
  inputs:
    command: 'init'
    backendType: 'azurerm'
    workingDirectory: '$(System.DefaultWorkingDirectory)/terraform'
    ensureBackend: false

- task: TerraformCLI@0
  inputs:
    command: 'apply'
    workingDirectory: '$(System.DefaultWorkingDirectory)/terraform'
    commandOptions: '-auto-approve'
```

---

## 📢 Contribute
If you have any improvements, feel free to open a pull request! 🚀
