
variable "search_service_name" {
  description = "The name of the Azure Cognitive Search service."
  type        = string
  default     = "classplusaisearch"
}
variable "sku" {
  description = "The SKU for the search service."
  type        = string
  default     = "standard"
}

variable "replicas" {
  description = "The number of replicas for the search service."
  type        = number
  default     = 1
}

variable "partitions" {
  description = "The number of partitions for the search service."
  type        = number
  default     = 1
}
