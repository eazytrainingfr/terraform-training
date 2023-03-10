variable "instance_template" {
  type    = string
  default = "g1-small"
}

variable "maintainer" {
    type = string
    default = "eazytraining"
}

variable "subnet_id" {
  type    = string
    default = "NULL"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
   type    = string
     default = "us-central1-c"
}

variable "image_family" {
    type = string
    default = "debian-11"
}
 
variable "image_project" {
    type = string
    default = "debian-cloud"
} 