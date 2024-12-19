resource "aws_vpc" "pci_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    "Environment" = "PCI"
    "Compliance"  = "PCI DSS"
  }
}

resource "aws_subnet" "pci_subnet" {
  vpc_id     = aws_vpc.pci_vpc.id
  cidr_block = "10.0.1.0/24"

  map_public_ip_on_launch = false

  tags = {
    "Environment" = "PCI"
    "Compliance"  = "PCI DSS"
  }
}

resource "aws_security_group" "pci_sg" {
  vpc_id = aws_vpc.pci_vpc.id

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

  tags = {
    "Environment" = "PCI"
    "Compliance"  = "PCI DSS"
  }
}
