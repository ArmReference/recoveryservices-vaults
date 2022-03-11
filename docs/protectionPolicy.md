# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | Yes      | Resource name associated with the resource.
backupManagementType | Yes      | This property is used as the discriminator for deciding the specific types in the polymorhpic chain of types.
retentionPolicy | Yes      | The retention policy with the details on backup copy retention ranges.
schedulePolicy | Yes      | The backup schedule specified as part of backup policy.
tags           | Yes      | Resource tags.
timeZone       | Yes      |
recoveryServicesName | Yes      |
DependsOn      | No       | Pass dependencies

### name

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Resource name associated with the resource.

### backupManagementType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

This property is used as the discriminator for deciding the specific types in the polymorhpic chain of types.

- Allowed values: `AzureIaasVM`, `AzureSql`, `AzureStorage`, `AzureWorkload`, `GenericProtectionPolicy`, `MAB`

### retentionPolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The retention policy with the details on backup copy retention ranges.

### schedulePolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The backup schedule specified as part of backup policy.

### tags

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Resource tags.

### timeZone

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)



### recoveryServicesName

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)



### DependsOn

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Pass dependencies

## Outputs

Name | Type | Description
---- | ---- | -----------
protectionPolicy | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.1",
    "metadata": {
        "template": "reference/protectionPolicy.json"
    },
    "parameters": {
        "name": {
            "value": ""
        },
        "backupManagementType": {
            "value": ""
        },
        "retentionPolicy": {
            "value": {}
        },
        "schedulePolicy": {
            "value": {}
        },
        "tags": {
            "value": {}
        },
        "timeZone": {
            "value": ""
        },
        "recoveryServicesName": {
            "value": ""
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
