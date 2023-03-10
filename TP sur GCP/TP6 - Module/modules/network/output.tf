output "output_subnet_id" {
    value = google_compute_subnetwork.subnet.id
}

output "output_vpc_id" {
    value = google_compute_network.vpc.id
  
}