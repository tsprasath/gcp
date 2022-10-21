resource "google_compute_network" "vpc_sunbird_jenkins" {
  name                    = "${var.prefix}-vpc-jenkins-${var.gcp_region}"
  auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_sunbird_jenkins" {
name = "${var.prefix}-vpc-jenkins-${var.gcp_region}"
auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_sunbird_kb" {
name = "${var.prefix}-vpc-kb-${var.gcp_region}"
auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_sunbird_db" {
name = "${var.prefix}-vpc-db-${var.gcp_region}"
auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_sunbird_dp" {
name = "${var.prefix}-vpc-dp-${var.gcp_region}"
auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_sunbird_yarn" {
name = "${var.prefix}-vpc-yarn-${var.gcp_region}"
auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sunbird" {
  name          = "${var.prefix}-jenkins-subnet"
  region        = var.gcp_region
  network       = google_compute_network.vpc_sunbird_jenkins.self_link
  ip_cidr_range = var.jenkins_subnet_prefix
}
