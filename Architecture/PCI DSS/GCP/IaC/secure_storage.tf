resource "google_storage_bucket" "pci_compliant_bucket" {
  name          = "pci-compliant-bucket"
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  logging {
    log_bucket = "gcs-logs-bucket"
    log_object_prefix = "gcs/"
  }

  encryption {
    default_kms_key_name = google_kms_crypto_key.pci_key.id
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}
