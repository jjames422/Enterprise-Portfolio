# GCP PCI DSS-Compliant Architecture

This directory contains resources for deploying a PCI DSS-compliant architecture in GCP using Terraform.

## Components
1. **VPC Network**:
   - Segmented into secure subnets.
2. **Firewall Rules**:
   - Allow only HTTPS traffic.
3. **Cloud SQL**:
   - Securely stores cardholder data with encryption.

## Files
- **GCP-PCI-DSS-Terraform.tf**: Terraform script to deploy the infrastructure.
- **GCP-Network-Diagram.png**: Diagram illustrating the architecture.

## Deployment
1. Authenticate with GCP:
   ```bash
   gcloud auth application-default login

2. Initialize Terraform:
   terraform init
   terraform apply
