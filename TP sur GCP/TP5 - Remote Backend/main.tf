resource "google_compute_network" "vpc" {
  name                    = "myvpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  name          = "mysubnet"
  ip_cidr_range = "10.1.20.0/24"
  network       = google_compute_network.vpc.id
}

resource "google_compute_instance" "default" {
  name         = "web-vm"
  machine_type = var.instance_template
  zone         = var.zone
  tags         = ["gcp", "terraform"]
  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.default.name}:  ${google_compute_instance.default.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }

  # Install web
  metadata_startup_script = "sudo apt-get update; sudo apt-get install nginx -y; sudo systemctl enable --now nginx"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
      nat_ip = data.google_compute_address.vm_static_ip.address # Attach static ip to NIC
    }
  }
}

resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "web" {
  name    = "web-app-firewall"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_storage_bucket" "default" {
  name          = "gcp-bucket-lewis"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}