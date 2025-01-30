# Terraform WebApp Example

This is a Terraform configuration for deploying an Storage account with an App Service Plan and a Resource Group. The resources will be deployed to Azure using the AzureRM provider.

## Files

- `main.tf`: Contains the main infrastructure configuration.
- `variables.tf`: Contains the input variables to customize the resources.
- `output.tf`: Defines the output to show the URL of the deployed App Service.

## Setup

1. **Install Terraform**: Make sure Terraform is installed on your machine. You can download it from [terraform.io](https://www.terraform.io/downloads.html).

2. **Configure Azure Provider**:
   Ensure you have the `azurerm` provider configured with the necessary credentials. Use the Azure CLI or service principal for authentication.

3. **Initialize Terraform**:
   ```bash
   terraform init

4. **Preview deployment**:
   ```bash
   terraform init

5. **Deploy to Azure**:
   ```bash
   terraform apply -auto-approve

