resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

#resource "google_compute_subnetwork" "private" {
 # name          = var.private_subnet
  #ip_cidr_range = "10.0.1.0/24"
  #region        = var.region
  #network       = google_compute_network.vpc.id
#}





resource "google_compute_subnetwork" "private" {
  name          = var.private_subnet
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id

  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = "10.1.0.0/16"
  }

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "10.2.0.0/20"
  }
}

resource "google_compute_subnetwork" "public" {
  name          = var.public_subnet
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}
