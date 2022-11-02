# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

# create the Private VPC
resource "google_compute_network" "demo_vpc" {
  name                            = "${var.prefix}-${var.env}-private-vpc"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}

resource "google_compute_subnetwork" "private-subnet_1" {
  name                     = "${var.prefix}-${var.env}-private-subnet"
  region                   = var.gcp_region
  network                  = google_compute_network.demo_vpc.self_link
  ip_cidr_range            = var.subnet_cidr_private
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}


# cloud Router
resource "google_compute_router" "router" {
  name    = "${var.prefix}-${var.env}-kubernetes"
  region  = var.gcp_region
  network = google_compute_network.demo_vpc.self_link

}

# NAT Gateway

resource "google_compute_router_nat" "nat" {
  name                               = "${var.prefix}-${var.env}-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.private-subnet_1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
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
