targetScope = 'resourceGroup'

@description('Name of the VNet for the Azure Enterprise Infrastructure Lab.')
param vnetName string = 'vnet-azlab-prod'

@description('VNet address space.')
param vnetAddressSpace string = '10.10.0.0/16'

@description('Application subnet prefix.')
param appSubnetPrefix string = '10.10.1.0/24'

@description('Data subnet prefix.')
param dataSubnetPrefix string = '10.10.2.0/24'

@description('Application NSG name.')
param nsgName string = 'nsg-app'

resource nsg 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: nsgName
  location: resourceGroup().location
  tags: {
    Project: 'AzureEnterpriseLab'
    Environment: 'Lab'
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: vnetName
  location: resourceGroup().location
  tags: {
    Project: 'AzureEnterpriseLab'
    Environment: 'Lab'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressSpace
      ]
    }
    subnets: [
      {
        name: 'snet-app'
        properties: {
          addressPrefix: appSubnetPrefix
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
      {
        name: 'snet-data'
        properties: {
          addressPrefix: dataSubnetPrefix
        }
      }
    ]
  }
}

output vnetId string = vnet.id
output appSubnetId string = resourceId('Microsoft.Network/virtualNetworks/subnets', vnet.name, 'snet-app')
