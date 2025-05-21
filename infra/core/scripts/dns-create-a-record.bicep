// dns-create-a-record.bicep
// Deployment script to create a DNS A record for the GraphRAG service

param resourceGroupName string
param dnsZoneName string
param recordName string
param ipv4Address string
param location string = resourceGroup().location

resource dnsARecordScript 'Microsoft.Resources/deploymentScripts@2023-08-01' = {
  name: 'dns-create-a-record-script'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.53.0'
    timeout: 'PT30M'
    retentionInterval: 'P1D'
    scriptContent: '''
      az network dns record-set a add-record \
        --resource-group "${resourceGroupName}" \
        --zone-name "${dnsZoneName}" \
        --record-set-name "${recordName}" \
        --ipv4-address "${ipv4Address}"
    '''
    forceUpdateTag: utcNow()
    cleanupPreference: 'OnSuccess'
  }
}
