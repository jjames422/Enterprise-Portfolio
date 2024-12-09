#!/bin/bash

# Variables
USER_NAME="example-user"
POLICY_NAME="ABACPolicy"
POLICY_FILE="AWS-ABAC-Policy.json"

# Create User
echo "Creating IAM user: $USER_NAME"
aws iam create-user --user-name $USER_NAME

# Attach Policy to User
echo "Attaching policy $POLICY_NAME to user $USER_NAME"
aws iam put-user-policy --user-name $USER_NAME --policy-name $POLICY_NAME --policy-document file://$POLICY_FILE

echo "Policy attached successfully."

Usage:
	1.	Save the AWS-ABAC-Policy.json file in the same directory as the script.
	2.	Run the script:
 chmod +x aws_iam_automation.sh
./aws_iam_automation.sh
