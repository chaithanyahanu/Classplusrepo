terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

# Data block for existing resource group
data "azurerm_resource_group" "Rgexisting" {
  name = "classplus-prod-RG"  # Assuming this is the correct resource group name
}

# Virtual Network (VNet) resource
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.Rgexisting.location  # Correct reference here
  resource_group_name = data.azurerm_resource_group.Rgexisting.name      # Correct reference here
}

# Subnet resource
resource "azurerm_subnet" "subnet" {
  for_each            = var.subnets
  resource_group_name = data.azurerm_resource_group.Rgexisting.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                = each.value["name"]
  address_prefixes    = each.value["address_prefixes"]
}
