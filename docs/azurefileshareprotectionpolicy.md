# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | Yes      | Resource name associated with the resource.
location       | No       | Resource location.
tags           | No       | Resource tags.
eTag           | No       | Optional ETag.
timeZone       | No       | TimeZone optional input as string. For example: TimeZone = 'Pacific Standard Time'.
workLoadType   | Yes      | Type of workload for the backup management
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

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Resource tags.

### eTag

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Optional ETag.

### timeZone

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

TimeZone optional input as string. For example: TimeZone = 'Pacific Standard Time'.

### workLoadType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Type of workload for the backup management

- Allowed values: `AzureFileShare`, `AzureSqlDb`, `Client`, `Exchange`, `FileFolder`, `GenericDataSource`, `Invalid`, `SAPAseDatabase`, `SAPHanaDatabase`, `SQLDB`, `SQLDataBase`, `Sharepoint`, `SystemState`, `VM`, `VMwareVM`

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
backupPolicies | object | AzureStorage backup policy.

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/azurefileshareprotectionpolicy.json"
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
        "eTag": {
            "value": ""
        },
        "timeZone": {
            "value": ""
        },
        "workLoadType": {
            "value": ""
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
