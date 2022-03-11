# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
schedulePolicyType | Yes      |
scheduleRunDays | No       |
scheduleRunFrequency | Yes      | Defines the frequency interval (daily or weekly) for the schedule policy.
scheduleRunTimes | No       |
scheduleWeeklyFrequency | Yes      | The number of times per week the schedule runs.

### schedulePolicyType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)



- Allowed values: `SimpleSchedulePolicy`, `LongTermSchedulePolicy`

### scheduleRunDays

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)



### scheduleRunFrequency

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Defines the frequency interval (daily or weekly) for the schedule policy.

- Allowed values: `Daily`, `Invalid`, `Weekly`

### scheduleRunTimes

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)



### scheduleWeeklyFrequency

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The number of times per week the schedule runs.

## Outputs

Name | Type | Description
---- | ---- | -----------
schedulePolicy | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.1",
    "metadata": {
        "template": "reference/schedulePolicy.json"
    },
    "parameters": {
        "schedulePolicyType": {
            "value": ""
        },
        "scheduleRunDays": {
            "value": []
        },
        "scheduleRunFrequency": {
            "value": ""
        },
        "scheduleRunTimes": {
            "value": []
        },
        "scheduleWeeklyFrequency": {
            "value": 0
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
