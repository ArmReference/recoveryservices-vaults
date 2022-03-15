# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
type           | Yes      | The type of managed identity used. 
userAssignedIdentities | No       | The list of user-assigned identities associated with the resource. The user-assigned identity dictionary keys will be ARM resource ids i

### type

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The type of managed identity used. 

- Allowed values: `None`, `SystemAssigned`, `UserAssigned`

### userAssignedIdentities

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The list of user-assigned identities associated with the resource. The user-assigned identity dictionary keys will be ARM resource ids i

## Outputs

Name | Type | Description
---- | ---- | -----------
identity | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/identitydata.json"
    },
    "parameters": {
        "type": {
            "value": ""
        },
        "userAssignedIdentities": {
            "value": {}
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
