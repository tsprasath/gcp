terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.41.0"
    }
  }
   required_version = ">=0.13.0"
}

provider "google" {
  credentials = "${file("account.json")}"
  project = var.gcp_project
  region  = var.gcp_region
  zone = var.gcp_zone
}
