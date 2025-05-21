// RBAC.bicep
// Centralized RBAC assignments for GraphRAG Accelerator
// This module assigns roles for developer access and service identities

param principalId string
param storageAccountName string
param cosmosDbName string
param searchServiceName string

// Storage Blob Data Contributor (scope: storage account)
resource storageBlobContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(storageAccountName, principalId, 'StorageBlobDataContributor')
  scope: storageAccountResource
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
    principalId: principalId
    principalType: 'User'
  }
}
resource storageAccountResource 'Microsoft.Storage/storageAccounts@2024-01-01' existing = {
  name: storageAccountName
}

// Search Contributor (scope: search service)
resource searchServiceResource 'Microsoft.Search/searchServices@2025-02-01-Preview' existing = {
  name: searchServiceName
}
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(searchServiceName, principalId, 'SearchContributor')
  scope: searchServiceResource
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c')
    principalId: principalId
    principalType: 'User'
  }
}
resource searchIndexDataContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(searchServiceName, principalId, 'SearchIndexDataContributor')
  scope: searchServiceResource
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'a154be20-db9c-4678-8ab7-66f6cc099a59')
    principalId: principalId
    principalType: 'User'
  }
}
resource searchIndexDataReader 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(searchServiceName, principalId, 'SearchIndexDataReader')
  scope: searchServiceResource
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7ca78c08-252a-4471-8644-bb5ff32d4ba0')
    principalId: principalId
    principalType: 'User'
  }
}

// Cosmos DB SQL Built-in Data Reader (scope: cosmosdb account, child resource)
resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2025-04-15' existing = {
  name: cosmosDbName
}
resource cosmosDbDataReader 'Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments@2024-12-01-preview' = {
  name: guid(cosmosDbName, principalId, 'CosmosDbDataReader')
  parent: cosmosDbAccount
  properties: {
    principalId: principalId
    roleDefinitionId: '/subscriptions/${subscription().subscriptionId}/resourceGroups/${resourceGroup().name}/providers/Microsoft.DocumentDB/databaseAccounts/${cosmosDbName}/sqlRoleDefinitions/00000000-0000-0000-0000-000000000002'
    scope: '/'
  }
}
