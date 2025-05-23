// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

@description('The name of the Container Registry resource. Will be automatically generated if not provided.')
param registryName string

@description('The location of the Container Registry resource.')
param location string = resourceGroup().location

resource registry 'Microsoft.ContainerRegistry/registries@2025-04-01' = {
  name: registryName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    adminUserEnabled: false
    encryption: {
      status: 'disabled'
    }
    dataEndpointEnabled: false
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: false
  }
}

output name string = registry.name
output id string = registry.id
output loginServer string = registry.properties.loginServer
