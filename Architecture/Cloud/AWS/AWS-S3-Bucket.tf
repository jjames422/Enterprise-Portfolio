provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-secure-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  logging {
    target_bucket = "logging-bucket-name"
    target_prefix = "logs/"
  }

  tags = {
    Name        = "MySecureBucket"
    Environment = "Production"
  }
}

How to Apply
	1.	Save the script as AWS-S3-Bucket.tf.
	2.	Run:
terraform init
terraform apply
