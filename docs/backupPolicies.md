# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | Yes      | Resource name associated with the resource.
properties     | Yes      | Workload-specific backup policies; AzureIaaSVMProtectionPolicy, MabProtectionPolicy, AzureSqlProtectionPolicy
tags           | Yes      | Resource tags.
DependsOn      | No       | Pass dependencies

### name

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Resource name associated with the resource.

### properties

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Workload-specific backup policies; AzureIaaSVMProtectionPolicy, MabProtectionPolicy, AzureSqlProtectionPolicy

### tags

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Resource tags.

### DependsOn

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Pass dependencies

## Outputs

Name | Type | Description
---- | ---- | -----------
backupPolicies | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/backupPolicies.json"
    },
    "parameters": {
        "name": {
            "value": ""
        },
        "properties": {
            "value": {}
        },
        "tags": {
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
