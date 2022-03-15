# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | Yes      | Resource name associated with the resource.
location       | No       | Resource location.
tags           | No       | Resource tags.
fabricName     | Yes      | Name of this policy's fabric.
timeZone       | No       | TimeZone optional input as string. For example: TimeZone = 'Pacific Standard Time'.
subProtectionPolicy | Yes      | List of sub-protection policies which includes schedule and retention
DependsOn      | No       | Pass dependencies

### name

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Resource name associated with the resource.

### location

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Resource location.

- Default value: `[resourceGroup().location]`

### tags

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Resource tags.

### fabricName

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of this policy's fabric.

### timeZone

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

TimeZone optional input as string. For example: TimeZone = 'Pacific Standard Time'.

### subProtectionPolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

List of sub-protection policies which includes schedule and retention

### DependsOn

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Pass dependencies

## Outputs

Name | Type | Description
---- | ---- | -----------
backupPolicies | object | Azure VM (Mercury) workload-specific backup policy.

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/genericprotectionpolicy.json"
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
        "fabricName": {
            "value": ""
        },
        "timeZone": {
            "value": ""
        },
        "subProtectionPolicy": {
            "value": []
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
