provider "azurerm" {
  features {}
}

# Data block to reference the existing resource group
data "azurerm_resource_group" "existing_rg" {
  name = "classplus-prod-RG"
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  sku {
    tier = "PremiumV2"
    size = "P1v2"
  }
}

resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    python_version = "3.9"
    scm_type       = "LocalGit"
  }

}
