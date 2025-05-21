// apim-import-openapi.bicep
// Deployment script to import OpenAPI spec into APIM after backend is deployed

param apimName string
param resourceGroupName string
param backendUrl string
param openApiSpecUrl string
param apiName string = 'GraphRAG'
param location string = resourceGroup().location

resource importOpenApiScript 'Microsoft.Resources/deploymentScripts@2023-08-01' = {
  name: 'apim-import-openapi-script'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.53.0'
    timeout: 'PT30M'
    retentionInterval: 'P1D'
    scriptContent: '''
      # Download OpenAPI spec
      curl -o openapi.json "${openApiSpecUrl}"
      # Import into APIM
      az apim api import \
        --resource-group "${resourceGroupName}" \
        --service-name "${apimName}" \
        --path "${apiName}" \
        --api-id "${apiName}" \
        --specification-format OpenApiJson \
        --specification-path openapi.json \
        --service-url "${backendUrl}"
    '''
    forceUpdateTag: utcNow()
    cleanupPreference: 'OnSuccess'
  }
}
