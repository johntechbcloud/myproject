@description('The name of the Virtual Network')
param vnetName string

@description('The Azure region where the resources will be deployed')
param location string = resourceGroup().location

@description('The address space for the entire VNet')
param vnetAddressPrefix string

@description('The name of the first subnet')
param subnet1Name string

@description('The address prefix for the first subnet')
param subnet1Prefix string

@description('The name of the second subnet')
param subnet2Name string

@description('The address prefix for the second subnet')
param subnet2Prefix string

@description('Tags to apply to the resources for billing and tracking')
param tags object = {
  Environment: 'Dev'
  Project: 'CitiBank'
  Owner: 'John'
  ManagedBy: 'Bicep'
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
    ]
  }
}

@description('The Resource ID of the created Virtual Network')
output vnetId string = vnet.id

@description('The names of the subnets created within the VNet')
output subnetNames array = [
  vnet.properties.subnets[0].name
  vnet.properties.subnets[1].name
]
