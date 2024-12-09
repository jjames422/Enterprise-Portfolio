resource myAppServicePlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: 'AppServicePlan'
  location: resourceGroup().location
  sku: {
    name: 'B1'
    capacity: 1
  }
}

resource myWebApp 'Microsoft.Web/sites@2021-01-15' = {
  name: 'MyWebApp'
  location: resourceGroup().location
  properties: {
    serverFarmId: myAppServicePlan.id
  }
}

resource mySqlServer 'Microsoft.Sql/servers@2020-02-02-preview' = {
  name: 'MySqlServer'
  location: resourceGroup().location
  properties: {
    administratorLogin: 'adminuser'
    administratorLoginPassword: 'P@ssw0rd123' // Replace with secure password
  }
}

resource mySqlDatabase 'Microsoft.Sql/servers/databases@2020-02-02-preview' = {
  name: 'MyDatabase'
  parent: mySqlServer
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
  }
}

How to Deploy:
	1.	Save the file as Azure-WebApp-Bicep.bicep.
	2.	Deploy using Azure CLI:
az deployment group create --resource-group myResourceGroup --template-file Azure-WebApp-Bicep.bicep
