resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  name          = "mysubnet-${var.maintainer}"
  ip_cidr_range = var.range_ip
  network       = google_compute_network.vpc.id
}
