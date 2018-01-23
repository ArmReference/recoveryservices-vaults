# recoveryservices-vaults
Reference deployment
```
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "StorageAccountName": {
      "type": "string"
    },
    "ContainerName": {
      "type": "string"
    },
    "SasToken": {
      "type": "string"
    }
  },
  "variables": {
    "Provider": "/Microsoft.RecoveryServices",
    "Resource": "/vaults",
    "templateUri": "[concat('https://',parameters('StorageAccountName'),'.blob.core.windows.net/',parameters('ContainerName'),variables('Provider'),variables('Resource'))]"

  },
  "resources": [
    {
      "name": "BuildSKU",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/sku.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "name": {
            "value": "RS0"
          },
          "tier": {
            "value": "Standard"
          }
        }
      }
    },
    {
      "name": "BuildRecoveryServicesVault",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [
        "[concat('Microsoft.Resources/deployments/','BuildSKU')]"
      ],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/vaults.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "name": {
            "value": "RSV-01"
          },
          "sku": {
            "value": "[reference('BuildSKU').outputs.sku.value]"
          },
          "tags": {
            "value": "[json('{\"TagName\": \"TagValue\"}')]"
          }
        }
      }
    }
  ],
  "outputs": {
    "vault": {
      "type": "object",
      "value": "[reference('BuildRecoveryServicesVault').outputs.vaults.value]"
    }
  }
}
```
