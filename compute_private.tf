

# Create Jenkins  Server in Private VPC

resource "google_compute_instance" "sunbird_jenkins_vm" {
  name         = "${var.prefix}-jenkins"
  zone         = var.gcp_zone
  machine_type = var.machine_type
  tags         = ["allow-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata_startup_script = "sudo apt-get update;"

  network_interface {
    network    = google_compute_network.vpc_private.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}

resource "google_compute_instance" "sunbird_db_vm" {
  name         = "${var.prefix}-db"
  zone         = var.gcp_zone
  machine_type = var.machine_type
  tags         = ["allow-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata_startup_script = "sudo apt-get update;"

  network_interface {
    network    = google_compute_network.vpc_private.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}

resource "google_compute_instance" "sunbird_kb_vm" {
  name         = "${var.prefix}-kb"
  zone         = var.gcp_zone
  machine_type = var.machine_type
  tags         = ["allow-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata_startup_script = "sudo apt-get update;"

  network_interface {
    network    = google_compute_network.vpc_private.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}

resource "google_compute_instance" "sunbird_dp_vm" {
  name         = "${var.prefix}-dp"
  zone         = var.gcp_zone
  machine_type = var.machine_type
  tags         = ["allow-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata_startup_script = "sudo apt-get update;"

  network_interface {
    network    = google_compute_network.vpc_private.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}


resource "google_compute_instance" "sunbird_yarn_vm" {
  name         = "${var.prefix}-yarn"
  zone         = var.gcp_zone
  machine_type = var.machine_type
  tags         = ["allow-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata_startup_script = "sudo apt-get update;"

  network_interface {
    network    = google_compute_network.vpc_private.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}

