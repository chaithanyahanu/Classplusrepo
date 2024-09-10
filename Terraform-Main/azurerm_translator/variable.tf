variable "translator_name" {
  description = "The name of the Azure Translator service"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the existing resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "sku_name" {
  description = "The SKU for the Azure Translator service"
  type        = string
  default     = "S1"  # You can adjust this depending on your needs
}

variable "custom_subdomain_name" {
  description = "Optional subdomain for the Azure Translator service"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for the Azure Translator service"
  type        = map(string)
  default     = {}
}
