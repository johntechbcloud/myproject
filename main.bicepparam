using 'main.bicep'

param vnetName = 'vnet-production-001'
param location = 'eastus'
param vnetAddressPrefix = '10.0.0.0/16'

param subnet1Name = 'snet-web'
param subnet1Prefix = '10.0.1.0/24'

param subnet2Name = 'snet-db'
param subnet2Prefix = '10.0.2.0/24'
