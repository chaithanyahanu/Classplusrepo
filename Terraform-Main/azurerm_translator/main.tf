provider "azurerm" {
  features {}
}

resource "azurerm_cognitive_account" "translator" {
  name                = var.translator_name
  resource_group_name = var.resource_group_name
  location            = var.location
  kind                = "CognitiveServices"
  sku_name            = var.sku_name

  properties {
    custom_subdomain_name = var.custom_subdomain_name
  }

  tags = var.tags
}

output "translator_endpoint" {
  value = azurerm_cognitive_account.translator.endpoint
}

output "translator_key" {
  value = azurerm_cognitive_account.translator.primary_access_key
}
