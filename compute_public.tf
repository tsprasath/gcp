# Create Bastion in public VPC
resource "google_compute_instance" "bastion" {
  name         = "${var.prefix}-bastion"
  zone         = var.gcp_zone
  machine_type = var.machine_type
  tags         = ["allow-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_public.name
    subnetwork = google_compute_subnetwork.public-subnet_1.self_link
  }
}