terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
backend "azurerm" {}
}
provider "azurerm" {
  features {}
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group_name.name
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  resource_group_name  = data.azurerm_resource_group.resource_group_name.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]
}
