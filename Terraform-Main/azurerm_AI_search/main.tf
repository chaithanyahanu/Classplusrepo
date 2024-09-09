provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "existing" {
  name = "classplus-prod-RG"
}

resource "azurerm_search_service" "example" {
  name                = "example-search-service"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  sku                 = var.sku
  replicas            = var.replicas
  partitions          = var.partitions

  tags = data.azurerm_resource_group.existing.tags
  }
}
