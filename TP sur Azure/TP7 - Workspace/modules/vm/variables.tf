variable "rg-name" {
  type = string
  description = "The name of the RG"
}

variable "rg-location" {
  type = string
  description = "The location of the RG"
}

variable "instance_template" {
  type = string
  description = "Template for the webserver"
  default     = "Standard_D2_v2"
}

variable "interface-id" {
  type = string
  description = "the id of the vnic interface"
}


