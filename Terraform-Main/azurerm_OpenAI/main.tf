provider "azurerm" {
  features {}
}

# Data block to fetch the existing resource group
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

# Azure OpenAI account configuration
resource "azurerm_openai_account" "openai_account" {
  name                = var.openai_account_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  sku_name            = var.sku_name

  identity {
    type = "SystemAssigned"
  }
}
