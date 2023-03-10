terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  backend "gcs" {
    bucket = "YOUR-BUCKET"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "YOUR-PROJECT-ID"
  region  = var.region
  zone    = var.zone
}