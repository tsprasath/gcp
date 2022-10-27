# allow ssh
resource "google_compute_firewall" "public-allow-ssh" {
  name    = "${google_compute_network.admin_vpc.name}-allow-ssh"
  network = google_compute_network.admin_vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = [
    "0.0.0.0/0"
  ]
  target_tags = ["allow-ssh"]
}

# allow rdp
resource "google_compute_firewall" "public-allow-rdp" {
  name    = "${google_compute_network.admin_vpc.name}-allow-rdp"
  network = google_compute_network.admin_vpc.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = [
    "0.0.0.0/0"
  ]
  target_tags = ["allow-rdp"]
}

# allow ping only from everywhere
resource "google_compute_firewall" "public-allow-ping" {
  name    = "${google_compute_network.admin_vpc.name}-allow-ping"
  network = google_compute_network.admin_vpc.name
  allow {
    protocol = "icmp"
  }
  source_ranges = [
    "0.0.0.0/0"
  ]
}

# allow Jenkins to  Public Access
resource "google_compute_firewall" "jenkins" {
  name    = "${google_compute_network.admin_vpc.name}-jenkins"
  network = google_compute_network.admin_vpc.name
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  source_ranges = [
    "${var.subnet_cidr_private_2}"
  ]
  target_tags = ["jenkins"]
}