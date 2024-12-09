provider "aws" {
  region = "us-east-1"
}

// VPC
resource "aws_vpc" "secure_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

// Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.secure_vpc.id
  cidr_block = "10.0.1.0/24"
}

// Security Group
resource "aws_security_group" "allow_https" {
  vpc_id = aws_vpc.secure_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// RDS Instance
resource "aws_db_instance" "pci_db" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "SecurePass123!"
  vpc_security_group_ids = [aws_security_group.allow_https.id]
}
