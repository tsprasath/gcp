# variable "tag_manager" {
#   type = map(string)
# }


variable "gcp_project" {
  description = "ID of your GCP project. Make sure you set this up before running this terraform code.  REQUIRED."
}

variable "prefix" {
  description = "This prefix will be included in the name of some resources. You can use your own name or any other short string here."
}

variable "gcp_region" {
  description = "The region where the resources are created."
  default     = "asia-south1"
}

variable "gcp_zone" {
  description = "The zone where the resources are created."
  default     = "asia-south1-b"
}

variable "subnet_cidr_public" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.0.0/24"
}
variable "subnet_cidr_private" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_private_2" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.2.0/24"
}

variable "env" {
  description = "The address prefix to use for the subnet."
}

variable "machine_type" {
  description = "Specifies the GCP instance type."
  default     = "f1-micro"
}