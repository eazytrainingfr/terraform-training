
data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}

data "google_compute_address" "vm_static_ip" {
  name   = "vmstaticip"
  region = "us-central1"
}
