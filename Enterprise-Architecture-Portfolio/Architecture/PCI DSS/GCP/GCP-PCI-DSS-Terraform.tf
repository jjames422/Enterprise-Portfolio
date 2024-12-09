provider "google" {
  project = "my-gcp-project-id"
  region  = "us-central1"
}

// VPC Network
resource "google_compute_network" "secure_vpc" {
  name = "secure-vpc"
}

// Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.secure_vpc.id
}

// Firewall Rules
resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = google_compute_network.secure_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

// Cloud SQL Instance
resource "google_sql_database_instance" "sql_instance" {
  name             = "pci-compliant-db"
  database_version = "POSTGRES_13"
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "default" {
  name     = "sqladmin"
  instance = google_sql_database_instance.sql_instance.name
  password = "SecurePass123!"
}
