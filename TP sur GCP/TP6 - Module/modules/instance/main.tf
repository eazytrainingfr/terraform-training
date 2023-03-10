data "google_compute_image" "my_image" {
  family  = var.image_family
  project = var.image_project
}

data "google_compute_address" "vm_static_ip" {
  name   = "vmstaticip"
  region = var.region
}


resource "google_compute_instance" "default" {
  name         = "web-${var.maintainer}"
  machine_type = var.instance_template
  zone         = var.zone
  tags         = ["${var.maintainer}"]
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
    subnetwork = var.subnet_id

    access_config {
      nat_ip = data.google_compute_address.vm_static_ip.address # Attach static ip to NIC
    }
  }
}