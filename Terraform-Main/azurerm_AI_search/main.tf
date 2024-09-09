provider "azurerm" {
  features {}
}

# Data block to reference the existing resource group
data "azurerm_resource_group" "existing_rg" {
  name = "classplus-prod-RG"
}

# Azure Cognitive Search service
resource "azurerm_search_service" "example" {
  name                = var.search_service_name  # Must be globally unique
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  sku {
    name = "standard"
    tier = "standard"
  }

  replicas   = 1
  partitions = 1

  tags = data.azurerm_resource_group.existing_rg.tags
}
