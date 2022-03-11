# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
retentionDuration | Yes      | Retention duration of the retention policy.
retentionScheduleDaily | No       | Daily retention format for the monthly retention policy.
retentionScheduleFormatType | Yes      | Retention schedule format type for monthly retention policy.
retentionScheduleWeekly | No       | Weekly retention format for the monthly retention policy.
retentionTimes | Yes      | Times in day when backup should be triggered. e.g. 01:00, 13:00.

### retentionDuration

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Retention duration of the retention policy.

### retentionScheduleDaily

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Daily retention format for the monthly retention policy.

### retentionScheduleFormatType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Retention schedule format type for monthly retention policy.

- Allowed values: `Daily`, `Invalid`, `Weekly`

### retentionScheduleWeekly

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Weekly retention format for the monthly retention policy.

### retentionTimes

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Times in day when backup should be triggered. e.g. 01:00, 13:00.

## Outputs

Name | Type | Description
---- | ---- | -----------
monthlySchedule | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/monthlySchedule.json"
    },
    "parameters": {
        "retentionDuration": {
            "value": {}
        },
        "retentionScheduleDaily": {
            "value": {}
        },
        "retentionScheduleFormatType": {
            "value": ""
        },
        "retentionScheduleWeekly": {
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
