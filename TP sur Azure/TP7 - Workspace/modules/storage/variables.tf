variable "rg-location" {
  type = string
  description = "The location of the RG"
}

variable "rg-name" {
  type = string
  description = "The name of the RG"
}

variable "container_access_type" {
  type = string
  description = "The access type of the container"
  default = "private"
} 