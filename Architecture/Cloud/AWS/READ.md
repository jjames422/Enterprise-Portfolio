# AWS Cloud Architecture

This folder contains resources and examples demonstrating secure and scalable cloud deployments on AWS.

## Highlights

1. **Lambda Function**: Python script for processing S3 bucket data and logging to CloudWatch.
2. **RDS Database**: Terraform script for deploying a PostgreSQL RDS instance with secure configurations.
3. **S3 Bucket**: Terraform example with encryption, logging, and versioning enabled.
4. **Network Diagram**: Visual representation of AWS architectures.

## Files

- **IaC-AWS-Security-Config.tf**: Security Group configuration using Terraform.
- **AWS-Lambda-Function.py**: Python code for AWS Lambda integration with S3.
- **AWS-RDS-Database.tf**: Terraform script to deploy a PostgreSQL RDS instance.
- **AWS-S3-Bucket.tf**: Secure S3 bucket setup using Terraform.
- **AWS-Network-Diagram.png**: Visual representation of AWS architecture.

## Deployment Instructions

1. Use Terraform to deploy infrastructure (RDS, S3).
2. Upload the Lambda function to AWS Lambda with an appropriate IAM role.
3. Refer to the network diagram for an overview of the architecture.

---
