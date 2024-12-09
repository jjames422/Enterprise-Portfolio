provider "google" {
  credentials = file("<path-to-service-account-key>.json") # Replace with your GCP service account key
  project     = "your-gcp-project-id"
  region      = "us-central1"
}

# Create a VPC network
resource "google_compute_network" "default" {
  name = "custom-network"
}

# Create a Firewall rule
resource "google_compute_firewall" "allow_https_ssh" {
  name    = "allow-https-ssh"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

# Create a Compute Engine instance
resource "google_compute_instance" "web_server" {
  name         = "web-server"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10" # Debian 10 image
    }
  }

  network_interface {
    network = google_compute_network.default.name

    access_config {
      # Automatically assigns a public IP
    }
  }

  metadata_startup_script = <<-EOT
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    echo "Welcome to your GCP web server!" > /var/www/html/index.html
    sudo systemctl restart apache2
  EOT

  tags = ["web-server"]
}

How to Apply
	1.	Save the file as GCP-Compute-VM.tf.
	2.	Initialize Terraform:
terraform init
