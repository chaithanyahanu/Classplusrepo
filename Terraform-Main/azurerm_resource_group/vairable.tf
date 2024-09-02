variable "resource_group_name" {
  type    = string
  default = "classplus-prod-RG"
}

variable "location" {
  type    = string
  default = "East US"
}
variable "tags" {
  type        = map(string)
  description = "Tags used for the deployment"
  default = {
    "Environment" = "Prod"
  }
}
