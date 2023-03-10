terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  backend "gcs" {
    bucket = "gcp-backend-<votre prénom>" # doit être créé manuellement au préalable dans gcp
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "eazytraining"
  region  = var.region
  zone    = var.zone
}
