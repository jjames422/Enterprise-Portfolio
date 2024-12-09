# Variables
$SubscriptionId = "12345678-1234-1234-1234-123456789abc"
$ResourceGroupName = "my-resource-group"
$RoleDefinitionId = "/subscriptions/$SubscriptionId/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
$PrincipalId = "abcd1234-abcd-1234-abcd-123456789abc" # User or Service Principal ID

# Assign Role
Write-Output "Assigning role..."
az role assignment create `
    --assignee $PrincipalId `
    --role "Contributor" `
    --scope "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroupName"

Write-Output "Role assignment completed."

Usage:
	1.	Replace variables with your Azure details.
	2.	Run the script in PowerShell:
 ./azure_role_assignment.ps1
