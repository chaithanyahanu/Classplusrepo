provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "existing" {
  name = "classplus-prod-RG"
}

resource "azurerm_search_service" "example" {
  name                = var.search_service_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  sku                 = "standard"
  replicas            = var.replicas
  partitions          = var.partitions
}
