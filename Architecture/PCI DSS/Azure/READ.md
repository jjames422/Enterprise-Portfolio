# Azure PCI DSS-Compliant Architecture

This directory contains resources for deploying a PCI DSS-compliant architecture in Azure using Bicep.

## Components
1. **Virtual Network (VNet)**:
   - Segmented into public and private subnets.
2. **Application Gateway**:
   - Handles HTTPS traffic.
3. **SQL Database**:
   - Securely stores cardholder data with encryption at rest.
4. **Compliance**:
   - Meets PCI DSS requirements for data security and network segmentation.

## Files
- **Azure-PCI-DSS-Bicep.bicep**: Bicep script to deploy the infrastructure.
- **Azure-Network-Diagram.png**: Diagram illustrating the architecture.

## Deployment
1. Use Azure CLI to deploy:
   ```bash
   az deployment group create --resource-group myResourceGroup --template-file Azure-PCI-DSS-Bicep.

   ---
Validate Compliance using Azure Security Center
### **2. GCP: PCI DSS-Compliant Architecture**
**Directory Structure**:
```plaintext
Cloud/
└── GCP/
    ├── README.md
    ├── GCP-PCI-DSS-Terraform.tf        # Terraform script for PCI DSS-compliant architecture
    └── GCP-Network-Diagram.png        # Diagram showing GCP architecture
