// Bicep parameters for GraphRAG Accelerator deployment
// Copy and customize these values as needed for your environment
using './deploy.bicep'
param resourceGroupName = 'rg-ragtest-wus'
param resourceBaseName = 'ragtestpoc'
param location = 'westus'
param apiPublisherName = 'Microsoft'
param apiPublisherEmail = 'publisher@microsoft.com'
param restoreAPIM = false
param apimTier = 'Developer'
param apimName = ''
param deployAcr = false
param existingAcrLoginServer = ''
param acrTokenName = ''
param acrTokenPassword = ''
param graphragImageName = 'graphrag'
param graphragImageVersion = 'latest'
param deployAoai = true
param existingAoaiId = ''
param llmModelName = 'gpt-4o'
param llmModelDeploymentName = 'gpt-4o'
param llmModelVersion = '2024-08-06'
param llmModelQuota = 1
param embeddingModelName = 'text-embedding-ada-002'
param embeddingModelDeploymentName = 'text-embedding-ada-002'
param embeddingModelVersion = '2'
param embeddingModelQuota = 1
param aksNamespace = 'graphrag'
param managedAppStorageAccountName = ''
param managedAppStorageAccountKey = ''
param enablePrivateEndpoints = true
param utcString = '<utc-now>'
// Set to true to enable developer RBAC assignment
param grantDevAccess = true
// Set to your Azure AD objectId. Find with: az ad signed-in-user show --query id -o tsv
param developerPrincipalId = 'dac62948-a373-48bc-9e5c-e8459249bf3e'
