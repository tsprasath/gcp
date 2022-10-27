

# Create Jenkins  Server in private AdminVPC

resource "google_compute_instance" "sunbird_jenkins_vm" {
  name         = "${var.prefix}-${var.env}-jenkins"
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
    network    = google_compute_network.admin_vpc.name
    subnetwork = google_compute_subnetwork.private-subnet_2.self_link
  }

}

# Creating other  Server in private  EnvVPC
resource "google_compute_instance" "sunbird_db_vm" {
  name         = "${var.prefix}-${var.env}-db"
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
    network    = google_compute_network.env_vpc.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}

resource "google_compute_instance" "sunbird_kb_vm" {
  name         = "${var.prefix}-${var.env}-kb"
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
    network    = google_compute_network.env_vpc.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}

resource "google_compute_instance" "sunbird_dp_vm" {
  name         = "${var.prefix}-${var.env}-dp"
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
    network    = google_compute_network.env_vpc.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}


resource "google_compute_instance" "sunbird_yarn_vm" {
  name         = "${var.prefix}-${var.env}-yarn"
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
    network    = google_compute_network.env_vpc.name
    subnetwork = google_compute_subnetwork.private-subnet_1.self_link
  }

}

