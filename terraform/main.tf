
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Lager en unik navnesuffiks
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

# Oppretter en Resource Group
resource "azurerm_resource_group" "lab" {
  name     = "rg-terraform-lab-${random_string.suffix.result}"
  location = "norwayeast"

  tags = {
    environment = "lab"
    project     = "terraform-learning"
  }
}

# Oppretter en Storage Account
resource "azurerm_storage_account" "lab" {
  name                     = "stlab${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.lab.name
  location                 = azurerm_resource_group.lab.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = {
    environment = "lab"
    project     = "terraform-learning"
  }

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }
  }
}


output "storage_account_name" {
  value = azurerm_storage_account.lab.name
}

resource "azurerm_storage_container" "lab" {
  name                  = "lab-files"
  storage_account_id    = azurerm_storage_account.lab.id
  container_access_type = "private"
}

