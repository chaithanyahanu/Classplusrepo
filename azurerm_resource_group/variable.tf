variable "resource_group_name" {
  type    = string
  default = "classplus-prod-RG"
}

variable "location" {
  type    = string
  default = "East US"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = any
}
