# allow ssh only from public subnet
# resource "google_compute_firewall" "private-allow-ssh" {
#   name    = "${google_compute_network.env_vpc.name}-allow-ssh"
#   network = google_compute_network.env_vpc.name
#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }
#   source_ranges = [
#     "${var.subnet_cidr_public}"
#   ]
#   target_tags = ["allow-ssh"]
# }

# # allow rdp only from public subnet
# resource "google_compute_firewall" "private-allow-rdp" {
#   name    = "${google_compute_network.env_vpc.name}-allow-rdp"
#   network = google_compute_network.env_vpc.name
#   allow {
#     protocol = "tcp"
#     ports    = ["3389"]
#   }
#   source_ranges = [
#     "${var.subnet_cidr_public}"
#   ]
#   target_tags = ["allow-rdp"]
# }

# # allow ping only from public subnet
# resource "google_compute_firewall" "private-allow-ping" {
#   name    = "${google_compute_network.env_vpc.name}-allow-ping"
#   network = google_compute_network.env_vpc.name
#   allow {
#     protocol = "icmp"
#   }
#   source_ranges = [
#     "${var.subnet_cidr_public}"
#   ]
# }

# # allow ping only from public subnet
# resource "google_compute_firewall" "private-allow-http" {
#   name    = "${google_compute_network.env_vpc.name}-allow-http"
#   network = google_compute_network.env_vpc.name
#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }
#   source_ranges = [
#     "${var.subnet_cidr_public}"
#   ]
# }

# # allow ping only from public subnet
# resource "google_compute_firewall" "private-allow-https" {
#   name    = "${google_compute_network.env_vpc.name}-allow-https"
#   network = google_compute_network.env_vpc.name
#   allow {
#     protocol = "tcp"
#     ports    = ["443"]
#   }
#   source_ranges = [
#     "${var.subnet_cidr_public}"
#   ]
# }


# resource "google_compute_firewall" "private-allow-https" {
#   name    = "${google_compute_network.env_vpc.name}-allow-https"
#   network = google_compute_network.env_vpc.name
#   allow {
#     protocol = "tcp"
#     ports    = ["443"]
#   }
#   source_ranges = [
#     "${var.subnet_cidr_public}"
#   ]
# }


# resource "google_compute_firewall" "private-allow-https" {
#   name    = "${google_compute_network.env_vpc.name}-allow-https"
#   network = google_compute_network.env_vpc.name
#   allow {
#     protocol = "tcp"
#     ports    = ["443"]
#   }
#   source_ranges = [
#     "${var.subnet_cidr_public}"
#   ]
# }

resource "google_compute_firewall" "private-allow-all-port" {
  name    = "${google_compute_network.env_vpc.name}-allow-all-port"
  network = google_compute_network.env_vpc.name
  allow {
    protocol = "all"
  }
  source_ranges = [
    "${var.subnet_cidr_public}"
  ]
}