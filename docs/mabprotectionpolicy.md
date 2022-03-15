# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | Yes      | Resource name associated with the resource.
location       | No       | Resource location.
tags           | Yes      | Resource tags.
retentionPolicy | Yes      | The retention policy with the details on backup copy retention ranges.
schedulePolicy | Yes      | The backup schedule specified as part of backup policy.
DependsOn      | No       | Pass dependencies

### name

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Resource name associated with the resource.

### location

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Resource location.

- Default value: `[resourceGroup().location]`

### tags

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Resource tags.

### retentionPolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The retention policy with the details on backup copy retention ranges.

### schedulePolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The backup schedule specified as part of backup policy.

### DependsOn

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Pass dependencies

## Outputs

Name | Type | Description
---- | ---- | -----------
backupPolicies | object | Mab container-specific backup policy.

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/mabprotectionpolicy.json"
    },
    "parameters": {
        "name": {
            "value": ""
        },
        "location": {
            "value": "[resourceGroup().location]"
        },
        "tags": {
            "value": {}
        },
        "retentionPolicy": {
            "value": {}
        },
        "schedulePolicy": {
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
