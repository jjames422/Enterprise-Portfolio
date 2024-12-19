# PCI DSS Requirements Mapping to GCP Services

## PCI DSS Requirements Addressed
1. **Requirement 1**: Install and maintain a firewall.
   - Solution: Use VPC firewall rules and hierarchical policies.
2. **Requirement 3**: Protect stored cardholder data.
   - Solution: Use GCS with KMS encryption and Cloud SQL with CMEK.
3. **Requirement 10**: Track and monitor access.
   - Solution: Enable Cloud Audit Logs for all PCI-relevant services.
4. **Requirement 12**: Maintain a security policy.
   - Solution: Enforce least-privilege access using IAM roles.

## GCP Services Used
- **Google Cloud Storage (GCS)**: Encrypted data storage with bucket-level access controls.
- **Cloud Key Management (KMS)**: Key management for encrypting sensitive data.
- **Cloud Audit Logs**: Audit logs for access tracking.
- **IAM**: Enforcing role-based access control.
- **VPC**: Isolated networks for PCI workloads.

For more details, refer to `/iac/` for implementation templates.
