resource "google_compute_firewall" "ssh" {
  name = "allow-ssh-http-${var.maintainer}"
  allow {
    ports    = ["22", "80"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = var.vpc_id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.maintainer}"]
}