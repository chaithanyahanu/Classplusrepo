variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = "classplus-prod-RG"
}

variable "vnet_name" {
  type        = string
  description = "The name of the vnet"
  default     = "prod-vnet"
}

variable "vnet_address_space" {
  type        = list(any)
  description = "the address space of the VNet"
  default     = ["10.14.0.0/16"]
}

variable "subnets" {
  type = map(any)
  default = {
    subnet_1 = {
      name             = "subnet_1"
      address_prefixes = ["10.14.7.0/24"]
    }
    subnet_2 = {
      name             = "subnet_2"
      address_prefixes = ["10.14.8.0/24"]
    }
    subnet_3 = {
      name             = "subnet_3"
      address_prefixes = ["10.14.9.0/24"]
    }
  }
}
