# AWS PCI DSS-Compliant Architecture

This directory contains resources for deploying a PCI DSS-compliant architecture in AWS using Terraform.

## Components
1. **VPC**:
   - Segmented into private subnets.
2. **Security Group**:
   - Allows only HTTPS traffic.
3. **RDS**:
   - Securely stores cardholder data with encryption.

## Files
- **AWS-PCI-DSS-Terraform.tf**: Terraform script to deploy the infrastructure.
- **AWS-Network-Diagram.png**: Diagram illustrating the architecture.

## Deployment
1. Initialize Terraform:
   ```bash
   terraform init
   terraform apply
