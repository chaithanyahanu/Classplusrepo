terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0" # Adjust the version according to your needs
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource group where the storage account will be deployed
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Storage account with ADLS Gen2
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  is_hns_enabled            = true  # Enables hierarchical namespace for ADLS Gen2

  # Optional, configuring the access tiers and network access
  access_tier               = var.access_tier
  allow_blob_public_access  = false
  min_tls_version           = "TLS1_2"
  
  tags = var.tags
}

# Optional: Blob container if you want to create one
resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
