# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
infrastructureEncryption | Yes      | Enabling/Disabling the Double Encryption state
userAssignedIdentity | Yes      | The user assigned identity to be used to grant permissions in case the type of identity used is UserAssigned
useSystemAssignedIdentity | Yes      | Indicate that system assigned identity should be used. Mutually exclusive with 'userAssignedIdentity' field
keyUri         | Yes      | The key uri of the Customer Managed Key

### infrastructureEncryption

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Enabling/Disabling the Double Encryption state

- Allowed values: `Disabled`, `Enabled`

### userAssignedIdentity

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The user assigned identity to be used to grant permissions in case the type of identity used is UserAssigned

### useSystemAssignedIdentity

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Indicate that system assigned identity should be used. Mutually exclusive with 'userAssignedIdentity' field

### keyUri

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The key uri of the Customer Managed Key

## Outputs

Name | Type | Description
---- | ---- | -----------
sku  | object |

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
            "value": ""
        },
        "userAssignedIdentity": {
            "value": ""
        },
        "useSystemAssignedIdentity": {
            "value": null
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
