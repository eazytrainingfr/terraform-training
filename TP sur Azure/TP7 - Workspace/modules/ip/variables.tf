
variable "public_ips" {
  type    = set(string)
  default = []
}

variable "resource_group_name" {
  type = string
}
variable "location" {
  type    = string
  default = "westeurope"
}

variable "sku" {
  type    = string
  default = "Standard"
}
variable "tags" {
  type        = map(string)
  description = "Any tags can be set"
  default     = {}
}