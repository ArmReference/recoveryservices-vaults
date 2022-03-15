# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | Yes      | Resource name associated with the resource.
location       | No       | Resource location.
tags           | No       | Resource tags.
azureBackupRGNamePrefix | No       | Prefix to apply to a ResourceGroup for backups
azureBackupRGNameSuffix | No       | Suffix to apply to a ResourceGroup for backups
instantRpRetentionRangeInDays | No       | Instant RP retention policy range in days
retentionPolicy | Yes      | Type of backup policy type
schedulePolicy | Yes      | Type of backup policy type
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

### azureBackupRGNamePrefix

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Prefix to apply to a ResourceGroup for backups

### azureBackupRGNameSuffix

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Suffix to apply to a ResourceGroup for backups

### instantRpRetentionRangeInDays

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Instant RP retention policy range in days

- Default value: `2`

### retentionPolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Type of backup policy type

### schedulePolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Type of backup policy type

### DependsOn

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Pass dependencies

## Outputs

Name | Type | Description
---- | ---- | -----------
backupPolicies | object | IaaS VM workload-specific backup policy.

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/azureiaasvmpolicy.json"
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
        "azureBackupRGNamePrefix": {
            "value": ""
        },
        "azureBackupRGNameSuffix": {
            "value": ""
        },
        "instantRpRetentionRangeInDays": {
            "value": 2
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
