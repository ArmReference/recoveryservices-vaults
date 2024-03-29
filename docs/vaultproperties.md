# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
infrastructureEncryption | No       | Enabling/Disabling the Double Encryption state
userAssignedIdentity | No       | The user assigned identity to be used to grant permissions in case the type of identity used is UserAssigned
useSystemAssignedIdentity | No       | Indicate that system assigned identity should be used. Mutually exclusive with 'userAssignedIdentity' field
keyUri         | No       | The key uri of the Customer Managed Key

### infrastructureEncryption

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Enabling/Disabling the Double Encryption state

- Default value: `Disabled`

- Allowed values: `Disabled`, `Enabled`

### userAssignedIdentity

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The user assigned identity to be used to grant permissions in case the type of identity used is UserAssigned

### useSystemAssignedIdentity

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Indicate that system assigned identity should be used. Mutually exclusive with 'userAssignedIdentity' field

- Default value: `True`

### keyUri

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The key uri of the Customer Managed Key

## Outputs

Name | Type | Description
---- | ---- | -----------
encryption | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/vaultproperties.json"
    },
    "parameters": {
        "infrastructureEncryption": {
            "value": "Disabled"
        },
        "userAssignedIdentity": {
            "value": ""
        },
        "useSystemAssignedIdentity": {
            "value": true
        },
        "keyUri": {
            "value": ""
        }
    }
}
```

### Command line

#### PowerShell

```powershell
New-AzResourceGroupDeployment -Name <deployment-name> -ResourceGroupName <resource-group-name> -TemplateFile <path-to-template> -TemplateParameterFile <path-to-templateparameter>
```

#### Azure CLI

```text
az group deployment create --name <deployment-name> --resource-group <resource-group-name> --template-file <path-to-template> --parameters @<path-to-templateparameterfile>
```
