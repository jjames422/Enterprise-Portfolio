resource "aws_kms_key" "pci_key" {
  description             = "KMS key for PCI DSS compliance"
  deletion_window_in_days = 30

  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {"AWS": "arn:aws:iam::123456789012:root"},
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Sid": "Allow PCI Use",
      "Effect": "Allow",
      "Principal": {"AWS": "arn:aws:iam::123456789012:role/PCIApplicationRole"},
      "Action": ["kms:Encrypt", "kms:Decrypt"],
      "Resource": "*"
    }
  ]
}
EOT

  tags = {
    "Environment" = "PCI"
    "Compliance"  = "PCI DSS"
  }
}
