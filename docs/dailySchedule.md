# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
retentionDuration | Yes      | Retention duration of the retention policy.
retentionTimes | Yes      | Times in day when backup should be triggered. e.g. 01:00, 13:00.

### retentionDuration

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Retention duration of the retention policy.

### retentionTimes

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Times in day when backup should be triggered. e.g. 01:00, 13:00.

## Outputs

Name | Type | Description
---- | ---- | -----------
dailySchedule | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/dailySchedule.json"
    },
    "parameters": {
        "retentionDuration": {
            "value": {}
        },
        "retentionTimes": {
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
