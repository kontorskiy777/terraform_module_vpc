// Purpose of that module to demonstrate how to work with Terraform modules

resource "google_compute_network" "my_vpc" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_mode
  mtu                     = 1460
}

resource "google_compute_subnetwork" "my_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.cidr
  region        = var.region
  network       = google_compute_network.my_vpc.id
  project       = var.project_id
}

resource "google_compute_router" "my_router" {
  name           = var.router_name
  network        = google_compute_network.my_vpc.name
  region         = var.region

}

resource "google_compute_router_nat" "nat" {
  name                               = var.router_nat_name
  router                             = google_compute_router.my_router.name
  region                             = google_compute_router.my_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ALL"
  }
}

resource "google_compute_firewall" "default" {
  name    = var.firewall_name
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}