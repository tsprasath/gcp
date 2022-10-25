# create the Private VPC
resource "google_compute_network" "vpc_private" {
  name                    = "${var.prefix}-private-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "private-subnet_1" {
  name          = "${var.prefix}-private-subnet"
  region        = var.gcp_region
  network       = google_compute_network.vpc_private.self_link
  ip_cidr_range = var.subnet_cidr_private
}

# create the Public VPC
resource "google_compute_network" "vpc_public" {
  name                    = "public-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "public-subnet_1" {
  name          = "public-subnet-1"
  ip_cidr_range = var.subnet_cidr_public
  network       = google_compute_network.vpc_public.name
  region        = var.gcp_region
}


# # cloud Router
# resource "google_compute_router" "router" {
#   name    = "${var.prefix}-jenkins"
#   network = google_compute_network.vpc_private_sunbird.self_link
#   bgp {
#     asn               = 64514
#     advertise_mode    = "CUSTOM"
#     advertised_groups = ["ALL_SUBNETS"]
#   }
# }

# # NAT Gateway

# resource "google_compute_router_nat" "nat" {
#   name                               = "${var.prefix}-router-nat"
#   router                             = google_compute_router.router.name
#   region                             = google_compute_router.router.region
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

#   log_config {
#     enable = true
#     filter = "ERRORS_ONLY"
#   }
# }