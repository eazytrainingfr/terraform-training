variable "rg-location" {
  type = string
}

variable "rg-name" {
  type = string
}

variable "network-address" {
  type    = list
  default = ["10.0.2.0/24"]
}