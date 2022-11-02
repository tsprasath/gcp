# create the Private VPC
resource "google_compute_network" "demo_vpc" {
  name                    = "${var.prefix}-${var.env}-private-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "private-subnet_1" {
  name          = "${var.prefix}-${var.env}-private-subnet"
  region        = var.gcp_region
  network       = google_compute_network.demo_vpc.self_link
  ip_cidr_range = var.subnet_cidr_private
}

# create the Public VPC
resource "google_compute_network" "admin_vpc" {
  name                    = "${var.prefix}-${var.env}-public-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "public-subnet_1" {
  name          = "${var.prefix}-${var.env}-public-subnet-1"
  ip_cidr_range = var.subnet_cidr_public
  network       = google_compute_network.admin_vpc.name
  region        = var.gcp_region
}

resource "google_compute_subnetwork" "private-subnet_2" {
  name          = "${var.prefix}-${var.env}-private-subnet-1"
  region        = var.gcp_region
  network       = google_compute_network.admin_vpc.self_link
  ip_cidr_range = var.subnet_cidr_private_2
}

# # cloud Router
# resource "google_compute_router" "router" {
#   name    = "${var.prefix}-${var.env}-jenkins"
#   network = google_compute_network.demo_vpc_sunbird.self_link
#   bgp {
#     asn               = 64514
#     advertise_mode    = "CUSTOM"
#     advertised_groups = ["ALL_SUBNETS"]
#   }
# }

# # NAT Gateway

# resource "google_compute_router_nat" "nat" {
#   name                               = "${var.prefix}-${var.env}--router-nat"
#   router                             = google_compute_router.router.name
#   region                             = google_compute_router.router.region
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

#   log_config {
#     enable = true
#     filter = "ERRORS_ONLY"
#   }
# }
