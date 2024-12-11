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
   ```
2.	List Available Targets:
   
   boundary targets list

4.	Start a Session:
 
   boundary connect -target-id ttcp_1234567890 -username dbuser -dbname example


   This ensures secure, ephemeral access without static credentials.
   ---

#### **e. Demo Script**
Add a shell script to automate setting up a development instance of Boundary for demonstration purposes.

**File: Boundary-Demo-Script.sh**
```bash
#!/bin/bash

# Install Boundary
echo "Installing HashiCorp Boundary..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install boundary -y

# Initialize Boundary Database (PostgreSQL)
echo "Setting up PostgreSQL for Boundary..."
sudo -u postgres psql -c "CREATE DATABASE boundary;"
sudo -u postgres psql -c "CREATE USER boundary WITH ENCRYPTED PASSWORD 'password';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE boundary TO boundary;"

# Start Boundary Server
echo
