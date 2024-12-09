#!/bin/bash

# Variables
PROJECT_ID="my-project"
MEMBER="user:example-user@example.com"
ROLE="roles/storage.objectViewer"
POLICY_FILE="GCP-Conditional-Role-Binding.json"

# Set IAM Policy
echo "Setting IAM policy for project $PROJECT_ID"
gcloud projects set-iam-policy $PROJECT_ID $POLICY_FILE

echo "IAM policy applied successfully."

Usage:
	1.	Save the GCP-Conditional-Role-Binding.json file in the same directory as the script.
	2.	Run the script:
 chmod +x gcp_iam_automation.sh
./gcp_iam_automation.sh
