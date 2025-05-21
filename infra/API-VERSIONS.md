# Azure Resource Provider API Versions

This document lists the API versions used in the GraphRAG Accelerator Bicep templates.

## Current API Versions

| Resource Type | API Version |
| ------------- | ----------- |
| Microsoft.Storage/storageAccounts | 2024-01-01 |
| Microsoft.Storage/storageAccounts/blobServices | 2024-01-01 |
| Microsoft.Storage/storageAccounts/blobServices/containers | 2024-01-01 |
| Microsoft.DocumentDB/databaseAccounts | 2025-04-15 |
| Microsoft.DocumentDB/databaseAccounts/sqlDatabases | 2025-04-15 |
| Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers | 2025-04-15 |
| Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments | 2024-12-01-preview |
| Microsoft.ContainerService/managedClusters | 2025-03-01 |
| Microsoft.ContainerService/managedClusters/maintenanceConfigurations | 2025-03-01 |
| Microsoft.CognitiveServices/accounts | 2024-10-01 |
| Microsoft.CognitiveServices/accounts/deployments | 2024-10-01 |
| Microsoft.Network/virtualNetworks | 2024-10-01 |
| Microsoft.Network/networkSecurityGroups | 2024-10-01 |
| Microsoft.Network/privateEndpoints | 2024-10-01 |
| Microsoft.Network/privateEndpoints/privateDnsZoneGroups | 2024-10-01 |
| Microsoft.Network/privateDnsZones | 2024-06-01 |
| Microsoft.Network/privateDnsZones/virtualNetworkLinks | 2024-06-01 |
| Microsoft.Network/privateDnsZones/A | 2024-06-01 |
| Microsoft.Network/publicIPAddresses | 2024-01-01 |
| Microsoft.Search/searchServices | 2025-02-01-Preview |
| Microsoft.ApiManagement/service | 2024-05-01 |
| Microsoft.ApiManagement/service/apis | 2024-05-01 |
| Microsoft.ApiManagement/service/apis/operations | 2024-05-01 |
| Microsoft.ApiManagement/service/diagnostics | 2024-05-01 |
| Microsoft.ApiManagement/service/loggers | 2024-06-01-preview |
| Microsoft.ManagedIdentity/userAssignedIdentities | 2024-11-30 |
| Microsoft.ManagedIdentity/userAssignedIdentities/federatedIdentityCredentials | 2024-11-30 |
| Microsoft.Authorization/roleAssignments | 2022-04-01 |
| Microsoft.Resources/deploymentScripts | 2023-08-01 |
| Microsoft.Insights/components | 2020-02-02 |
| Microsoft.Insights/privateLinkScopes | 2023-06-01-preview |
| Microsoft.Insights/privateLinkScopes/scopedResources | 2023-06-01-preview |
| Microsoft.OperationalInsights/workspaces | 2025-02-01 |
| Microsoft.ContainerRegistry/registries | 2025-04-01 |

## Notes

1. The warnings about "Resource type does not have types available" are common when using the latest API versions and don't prevent deployment.
2. Always check the Azure Resource Manager reference documentation for new API versions when updating templates.
3. All API versions in this project have been updated to the latest GA (General Availability) version as of May 2025, with Preview versions used only when necessary.

## References

- [Azure Resource Manager reference](https://learn.microsoft.com/en-us/azure/templates/)
- [Bicep documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
