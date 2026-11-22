# Azure Infrastructure as Code – Terraform Lab

A hands-on cloud infrastructure project built with
Microsoft Azure, Terraform, Azure CLI and GitHub.

## Project Overview

This project demonstrates how to provision and manage
Azure infrastructure using Infrastructure as Code (IaC).

[Blob Storage recovery test](notes/environment.md#verifisering)



## Architecture

```mermaid
flowchart TD
    A[Terraform CLI] --> B[Azure Resource Group]
    B --> C[Azure Storage Account]
    B --> D[Virtual Network]
    D --> E[Subnet]
    E --> F[Network Security Group]
```

## Technologies

- Microsoft Azure
- Terraform
- Azure CLI
- Git & GitHub
- GitHub Actions
- Visual Studio Code

## Azure Resources

| Resource | Purpose |
|---|---|
| Resource Group | Infrastructure organization |
| Storage Account | Cloud data storage |
| Virtual Network | Private Azure networking |
| Subnet | Network segmentation |
| Network Security Group | Network traffic control |


## Verification

**Blob Storage recovery**  
![Restored test file in Azure Blob Storage](docs/blob-recovery.png)

**Terraform validation**  
![Successful Terraform validation in GitHub Actions](docs/terraform-validation.png)

[See the Blob Storage test steps](notes/environment.md#verifisering)


## Deployment

Prerequisites: Terraform, Azure CLI and an Azure
subscription with appropriate permissions.

```bash
az login
export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
terraform init
terraform validate
terraform plan
terraform apply
```

Run Terraform commands from the directory containing main.tf.

## Local Validation and Deployment

Run `terraform validate` from the `terraform/` directory after `terraform init`.
Review the deployment plan with `terraform plan` before running `terraform apply`.

## Security

- Terraform state files are excluded from Git.
- No credentials are stored in the repository.
- No public virtual machines are deployed.

## Project Status

Azure infrastructure deployed and managed with Terraform.


