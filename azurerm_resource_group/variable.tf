variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = any
}
