resource "aws_s3_bucket" "pci_compliant_bucket" {
  bucket = "pci-compliant-bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
        kms_master_key_id = aws_kms_key.pci_key.id
      }
    }
  }

  lifecycle_rule {
    enabled = true
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  logging {
    target_bucket = "pci-logs-bucket"
    target_prefix = "s3/"
  }
}
