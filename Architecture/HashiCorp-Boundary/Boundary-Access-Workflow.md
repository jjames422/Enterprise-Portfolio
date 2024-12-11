# HashiCorp Boundary Access Workflow

This document explains how users securely access resources using Boundary.

## Workflow Steps
1. **Authentication**:
   - Users authenticate using an identity provider (e.g., Okta, Azure AD) or username/password.

2. **Authorization**:
   - RBAC ensures users can access only approved resources based on roles.

3. **Session Creation**:
   - Boundary brokers a session to the target resource without exposing static credentials.

4. **Dynamic Credential Injection**:
   - Boundary integrates with Vault to provide session-based, time-limited credentials.

## Example: Accessing a PostgreSQL Database
1. Login:
   ```bash
   boundary authenticate password -auth-method-id=ampw_1234567890 -login-name=admin
