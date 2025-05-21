// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.
//
// This file is the entry point for deploying the GraphRAG Accelerator infrastructure using Bicep.
// Usage: az deployment group create --resource-group <resource-group> --template-file ./deploy.bicep --parameters ./deploy.bicepparam

// Define all parameters that will be passed to the main module
@minLength(1)
@maxLength(64)
@description('Name of the resource group that GraphRAG will be deployed in.')
param resourceGroupName string = resourceGroup().name

@description('Unique name to append to each resource')
param resourceBaseName string = ''

@description('Cloud region for all resources')
param location string = resourceGroup().location

@minLength(1)
@description('Name of the publisher of the API Management service.')
param apiPublisherName string = 'Microsoft'

@minLength(1)
@description('Email address of the publisher of the API Management service.')
param apiPublisherEmail string = 'publisher@microsoft.com'

@description('Whether or not to restore the API Management service from a soft-deleted state.')
param restoreAPIM bool = false
param apimTier string = 'Developer'
param apimName string = ''

@description('Whether or not to deploy a new ACR resource instead of connecting to an existing service.')
param deployAcr bool = false
param existingAcrLoginServer string = ''
@description('The ACR token username. This is only used if an existing ACR is used.')
param acrTokenName string = ''
@secure()
@description('The ACR token password. This is only used if an existing ACR is used.')
param acrTokenPassword string = ''
param graphragImageName string = 'graphrag'
param graphragImageVersion string = 'latest'

@description('Whether or not to deploy a new AOAI resource instead of connecting to an existing service.')
param deployAoai bool = true
@description('Resource id of an existing AOAI resource.')
param existingAoaiId string = ''
@description('Name of the AOAI LLM model to use.')
param llmModelName string = 'gpt-4o'
@description('Deployment name of the AOAI LLM model to use.')
param llmModelDeploymentName string = 'gpt-4o'
@description('Model version of the AOAI LLM model to use.')
param llmModelVersion string = '2024-08-06'
@description('Quota of the AOAI LLM model to use.')
param llmModelQuota int = 1
@description('Name of the AOAI embedding model to use.')
param embeddingModelName string = 'text-embedding-ada-002'
@description('Deployment name of the AOAI embedding model to use.')
param embeddingModelDeploymentName string = 'text-embedding-ada-002'
@description('Model version of the AOAI embedding model to use.')
param embeddingModelVersion string = '2'
@description('Quota of the AOAI embedding model to use.')
param embeddingModelQuota int = 1

@description('The AKS namespace to install GraphRAG in.')
param aksNamespace string = 'graphrag'

@description('This parameter will only get defined during a managed app deployment.')
param managedAppStorageAccountName string = ''
@secure()
@description('This parameter will only get defined during a managed app deployment.')
param managedAppStorageAccountKey string = ''

@description('Whether to use private endpoint connections or not.')
param enablePrivateEndpoints bool = true

@description('UTC timestamp string for deployment uniqueness')
param utcString string = utcNow()

@description('Whether to grant developer access to Azure resources (RBAC assignments).')
param grantDevAccess bool = false

@description('ObjectId of the developer to grant RBAC access. Set to your user objectId.')
param developerPrincipalId string = ''

// Import the main infrastructure module
module main 'main.bicep' = {
  name: 'main-infra-deployment'
  params: {
    resourceGroupName: resourceGroupName
    resourceBaseName: resourceBaseName
    location: location
    apiPublisherName: apiPublisherName
    apiPublisherEmail: apiPublisherEmail
    restoreAPIM: restoreAPIM
    apimTier: apimTier
    apimName: apimName
    deployAcr: deployAcr
    existingAcrLoginServer: existingAcrLoginServer
    acrTokenName: acrTokenName
    acrTokenPassword: acrTokenPassword
    graphragImageName: graphragImageName
    graphragImageVersion: graphragImageVersion
    deployAoai: deployAoai
    existingAoaiId: existingAoaiId
    llmModelName: llmModelName
    llmModelDeploymentName: llmModelDeploymentName
    llmModelVersion: llmModelVersion
    llmModelQuota: llmModelQuota
    embeddingModelName: embeddingModelName
    embeddingModelDeploymentName: embeddingModelDeploymentName
    embeddingModelVersion: embeddingModelVersion
    embeddingModelQuota: embeddingModelQuota
    aksNamespace: aksNamespace
    managedAppStorageAccountName: managedAppStorageAccountName
    managedAppStorageAccountKey: managedAppStorageAccountKey
    enablePrivateEndpoints: enablePrivateEndpoints
    utcString: utcString
    grantDevAccess: grantDevAccess
    developerPrincipalId: developerPrincipalId
  }
}

// Expose outputs from the main module
output deployer_principal_id string = main.outputs.deployer_principal_id
output azure_location string = main.outputs.azure_location
output azure_tenant_id string = main.outputs.azure_tenant_id
output azure_ai_search_name string = main.outputs.azure_ai_search_name
output azure_acr_login_server string = main.outputs.azure_acr_login_server
output azure_acr_name string = main.outputs.azure_acr_name
output azure_aks_name string = main.outputs.azure_aks_name
output azure_aks_controlplanefqdn string = main.outputs.azure_aks_controlplanefqdn
output azure_aks_managed_rg string = main.outputs.azure_aks_managed_rg
output azure_aks_service_account_name string = main.outputs.azure_aks_service_account_name
output azure_aoai_endpoint string = main.outputs.azure_aoai_endpoint
output azure_aoai_llm_model string = main.outputs.azure_aoai_llm_model
output azure_aoai_llm_model_deployment_name string = main.outputs.azure_aoai_llm_model_deployment_name
output azure_aoai_llm_model_quota int = main.outputs.azure_aoai_llm_model_quota
output azure_aoai_llm_model_api_version string = main.outputs.azure_aoai_llm_model_api_version
output azure_aoai_embedding_model string = main.outputs.azure_aoai_embedding_model
output azure_aoai_embedding_model_deployment_name string = main.outputs.azure_aoai_embedding_model_deployment_name
output azure_aoai_embedding_model_quota int = main.outputs.azure_aoai_embedding_model_quota
output azure_aoai_embedding_model_api_version string = main.outputs.azure_aoai_embedding_model_api_version
output azure_apim_gateway_url string = main.outputs.azure_apim_gateway_url
output azure_apim_name string = main.outputs.azure_apim_name
output azure_app_hostname string = main.outputs.azure_app_hostname
output azure_app_url string = main.outputs.azure_app_url
output azure_app_insights_connection_string string = main.outputs.azure_app_insights_connection_string
output azure_cosmosdb_endpoint string = main.outputs.azure_cosmosdb_endpoint
output azure_cosmosdb_name string = main.outputs.azure_cosmosdb_name
output azure_cosmosdb_id string = main.outputs.azure_cosmosdb_id
output azure_dns_zone_name string = main.outputs.azure_dns_zone_name
output azure_private_dns_zones array = main.outputs.azure_private_dns_zones
output azure_storage_account string = main.outputs.azure_storage_account
output azure_storage_account_blob_url string = main.outputs.azure_storage_account_blob_url
output azure_workload_identity_client_id string = main.outputs.azure_workload_identity_client_id
output azure_workload_identity_principal_id string = main.outputs.azure_workload_identity_principal_id
output azure_workload_identity_name string = main.outputs.azure_workload_identity_name
