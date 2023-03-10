terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  project = "eazytraining"
  region  = var.region
  zone    = var.zone
}