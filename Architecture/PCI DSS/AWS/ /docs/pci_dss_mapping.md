# PCI DSS Requirements Mapping to AWS Services

## PCI DSS Requirements Addressed
1. **Requirement 1**: Install and maintain a firewall.
   - Solution: AWS VPC with security groups and NACLs.
2. **Requirement 3**: Protect stored cardholder data.
   - Solution: S3 with KMS encryption.
3. **Requirement 10**: Track and monitor access.
   - Solution: AWS CloudTrail for auditing and monitoring.
4. **Requirement 12**: Maintain a security policy.
   - Solution: IAM policies enforcing least privilege.

## AWS Services Used
- **Amazon S3**: Encrypted data storage with access controls.
- **AWS KMS**: Key management for encrypting sensitive data.
- **CloudTrail**: Audit logs for access tracking.
- **Config**: Compliance checks and monitoring.
- **IAM**: Enforcing role-based access control.

For more details, refer to `/iac/` for implementation templates.
