# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | Yes      | The name of the recovery services vault.
location       | No       | Resource location.
etag           | No       | Optional ETag.
sku            | Yes      | Identifies the unique system identifier for each Azure resource.
tags           | No       | Resource tags.
identity       | No       |
VaultProperties | No       | Customer Managed Key details of the resource.
DependsOn      | No       | Pass dependencies

### name

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The name of the recovery services vault.

### location

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Resource location.

- Default value: `[resourceGroup().location]`

### etag

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Optional ETag.

### sku

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Identifies the unique system identifier for each Azure resource.

### tags

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Resource tags.

### identity

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)



### VaultProperties

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Customer Managed Key details of the resource.

### DependsOn

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Pass dependencies

## Outputs

Name | Type | Description
---- | ---- | -----------
vaults | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/vaults.json"
    },
    "parameters": {
        "name": {
            "value": ""
        },
        "location": {
            "value": "[resourceGroup().location]"
        },
        "etag": {
            "value": ""
        },
        "sku": {
            "value": {}
        },
        "tags": {
            "value": {}
        },
        "identity": {
            "value": {}
        },
        "VaultProperties": {
            "value": {}
        },
        "DependsOn": {
            "value": []
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
