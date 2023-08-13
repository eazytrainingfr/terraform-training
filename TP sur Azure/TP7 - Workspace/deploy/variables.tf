
variable "instance_template_map" {
  type = map(any)
  default = {
    default = "Standard_D1_v2"
    dev     = "Standard_D1_v2"
    prod    = "Standard_D2_v2"
  }
}