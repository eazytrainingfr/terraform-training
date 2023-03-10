
variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "instance_template_map" {
  type = map(any)
  default = {
    default = "f1-micro"
    dev     = "f1-micro"
    prod    = "g1-small"
  }

}