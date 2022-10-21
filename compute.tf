resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "google_compute_instance" "sunbird" {
  name         = var.prefix
  zone         = var.gcp_zone
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.sunbird.self_link
    access_config {
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${chomp(tls_private_key.ssh-key.public_key_openssh)} terraform"
  }

#   tags = ["http-server"]

#   labels = {
#     name = "sunbird"
#   }

}

